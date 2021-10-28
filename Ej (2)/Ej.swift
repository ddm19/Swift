//Ejercicio 1
//
//a
func prefijos(prefijo:String,palabras:[String])->[Bool]
{
  if(palabras.isEmpty)
  {
    return[]
  }
  else
  {
    return[palabras[0].hasPrefix(prefijo)]+prefijos(prefijo:prefijo,palabras:Array( palabras.dropFirst()))

  }
}
//b
func MayorParImpar(numeroparej:(Int,Int),numero: Int)->(Int,Int)
{
  if(numero % 2 != 0)
  {
    return(max(numeroparej.0,numero),numeroparej.1)
  }
  else
  {
    return(numeroparej.0,max(numeroparej.1,numero))
  }
}
func parejaMayorParImpar(numeros:[Int])->(Int,Int)
{
  if(numeros.isEmpty)
  {
    return(0,0)
  }
  else
  {
    let resto = Array(numeros.dropFirst())
    let primero = numeros[0]
      return MayorParImpar(numeroparej: parejaMayorParImpar(numeros: resto) , numero: primero)
  }
}
//Ejercicio 2
//
//a 

func compruebaParejas(_ array:[Int] , funcion:(Int)->Int) -> [(Int,Int)]
{
	if(array.count < 2)
	{
		return []
	}
	else
	{
			if(funcion(array[0]) == array[1])
			{
				return [ (array[0],array[1]) ] + compruebaParejas(Array(array.dropFirst()),funcion:funcion)
			}
			else
			{
				return compruebaParejas(Array(array.dropFirst()),funcion:funcion)
			}
	}
	
}
//b 
func coincidetupla(_ tupla: (Int,Int),_ funcion:(Int)->Int) -> Bool
{
	var coincide :Bool = false;
	if(funcion(tupla.0) == tupla.1)
	{
		coincide = true;
	}
	return coincide;
}
func coinciden(parejas: [(Int,Int)], funcion: (Int)->Int) -> [Bool]
{
	if(parejas.isEmpty)
	{
		return []
	}
	else
	{
		return [coincidetupla(parejas[0],funcion)]+coinciden(parejas: Array(parejas.dropFirst()),funcion:funcion)
	}
}
//Ejercicio 3
//
enum Movimiento
{
	case deposito(Double)
	case cargoRecibo(String,Double)
	case cajero (Double)
}

func aplica(movimientos:[Movimiento]) -> (Double,[String])
{
	if(!movimientos.isEmpty)
	{
		let movimiento = movimientos[0]
		let aplicarec = aplica(movimientos:Array(movimientos.dropFirst()))
		switch movimiento
		{
			case let .deposito(x):
				return (x+aplicarec.0,[]+aplicarec.1)
			case let .cargoRecibo(concepto,x):
				return (aplicarec.0-x,[concepto]+aplicarec.1)
			case let .cajero(x):
				return (aplicarec.0-x,[]+aplicarec.1)
		}
		
	}
	else
	{
			return(0,[])
	}
	
}
//Ejercicio 4
//
indirect enum ArbolBinario
{
    case nodo (Int,ArbolBinario,ArbolBinario)
    case vacio 
}
func sumab(arbolb: ArbolBinario) -> Int
{
	switch arbolb
	{
		case let .nodo(x,ab1,ab2):
			return x+sumab(arbolb:ab1)+sumab(arbolb:ab2)
		case .vacio:
			return 0
	}
}
//Ejercicio 5
//
indirect enum Arbol
{
	case nodo(Int,[Arbol])
	case vacio
}
func suma(arbol:Arbol, cumplen: (Int) -> Bool) -> Int
{
	switch arbol
	{
		case let .nodo(x,hijos):
			if(cumplen(x))
			{
				return x + sumabosque(arboles:hijos,cumplen:cumplen)
			}
			else
			{
				return sumabosque(arboles: hijos, cumplen: cumplen)
			}
		case .vacio:
			return 0
	}
}
func sumabosque (arboles: [Arbol], cumplen: (Int) -> Bool) -> Int
{
	if(arboles.isEmpty)
	{
		return 0
	}
	else
	{
			return suma(arbol: arboles[0],cumplen:cumplen)+sumabosque(arboles: Array(arboles.dropFirst()),cumplen:cumplen)
	}
}
