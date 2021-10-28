//Ejercicio 1
//a
func maxOpt(_ x: Int?, _ y: Int?) -> Int?
{
	if let n1 = x, let n2 = y
	{
		return max(n1,n2)
	}
	else if let n1 = x
	{
			return n1
	}
	else if let n2 = y
	{
		return n2
	}
	else
	{
		return nil
	}

}
//b1
func MayorParImpar(numeroparej:(Int?,Int?),numero: Int)->(Int?,Int?)
{
  if(numero % 2 != 0)
  {
    return(maxOpt(numeroparej.0,numero),numeroparej.1)
  }
  else
  {
    return(numeroparej.0,maxOpt(numeroparej.1,numero))
  }
}
func parejaMayorParImpar(numeros:[Int])->(Int?,Int?)
{
  if(numeros.isEmpty)
  {
    return(nil,nil)
  }
  else
  {
    let resto = Array(numeros.dropFirst())
    let primero = numeros[0]
      return MayorParImpar(numeroparej: parejaMayorParImpar(numeros: resto) , numero: primero)
  }
}
//b2
func sumaMaxParesImpares(numeros: [Int]) -> Int
{
	let pareja = parejaMayorParImpar(numeros:numeros)
	if let par0 = pareja.0 ,let par1 = pareja.1
	{
		return par0 + par1 
	}
	else if let par0 = pareja.0
	{
		return par0
	}
	else if let par1 = pareja.1
	{
		return par1
	}
	else
	{
		return 0
	}
}

//Ejercicio2

// -a1
// let nums = [1,2,3,4,5,6,7,8,9,10]
// nums.filter{$0 % 3 == 0}.count
// - 3

// -a2
// let nums2 = [1,2,3,4,5,6,7,8,9,10]
// nums2.map{$0+100}.filter{$0 % 5 == 0}.reduce(0,+)
// - 210

// -a3
// let cadenas = ["En", "un", "lugar", "de", "La", "Mancha"]
// cadenas.sorted{$0.count < $1.count}.map{$0.count}
// - [2,2,2,2,5,6]

// -a4
// let cadenas2 = ["En", "un", "lugar", "de", "La", "Mancha"]
/* cadenas2.reduce([]) {
    (res: [(String, Int)], c: String) -> [(String, Int)] in
        res + [(c, c.count)]}.sorted(by: {$0.1 < $1.1})  */
// - [(En,2),(un,2),(de,2),(la,2),(lugar,5),(mancha,6)]

// -b1
/* func f(nums: [Int], n: Int) -> Int {
    return nums.filter{$0 == n}.count
} */
// - La función recibe un array de enteros y un número devuelve el número de enteros en ese array iguales a ese número f([1,2,3,2,3],2) -> 2

// -b2
/* func g(nums: [Int]) -> [Int] {
    return nums.reduce([], {
        (res: [Int], n: Int) -> [Int] in
            if !res.contains(n) {
                return res + [n]
            } else {
                return res
            }
    })
}
} */
// - Recibe un array y un entero y devuelve el mismo array con el nuevo elemento, a no ser que ya lo contenga. g([1 2 3],3) - > [1 2 3] ; g([1 2],3)-> [1 2 3]

// -b1
/* func h(nums: [Int], n: Int) -> ([Int], [Int]) {
   return nums.reduce(([],[]), {
       (res: ([Int],[Int]), num: Int ) -> ([Int],[Int]) in
           if (num >= n) {
               return (res.0, res.1 + [num])
           } else {
               return ((res.0 + [num], res.1))
           }
   })
}
} */
// Recibe un array y un entero y devuelve una tupla con 2 arrays, el izquierdo con los números menores al entero, y el derecho con el resto. h([2 3 4 5],4) ->([2 3],[4 5])

// c
func sumac(palabras: [String], contienen: Character) -> Int
{
	return palabras.map{ 
		var a = 0
		if ($0.contains(contienen))
		{ 
			a = $0.count
		
		}
		return a }.reduce(0,+)
	
}

//c2 
func sumaMenoresMayores(nums: [Int], pivote: Int) -> (Int, Int)
{
	return nums.reduce((0,0), 
	{ 
		(acum: (Int,Int), num: Int ) -> (Int,Int) in
		if ( num < pivote)
		{
			return (acum.0 + num,acum.1)
		}
		else
		{
			return (acum.0,acum.1 + num)
		}
	}
	)
}
//d
func bar(f: (Int) -> Int) {
  print(f(4))
}

func foo() -> (Int) -> Int {
  var x = 3
  return {
    x += $0 + 2
    return x
  }
}

//Ejercicio 3

indirect enum Arbol<T>
{
	case nodo (T,[Arbol<T>])
	case vacio
}

func toArray<T>(arbol:Arbol<T>) -> [T]
{
	switch arbol
	{
		case let .nodo(x,bosque):
			return [x]+toArrayBosque(hijos:bosque)
		case .vacio:
			return []
	}
}

func toArrayBosque<T>(hijos: [Arbol<T>]) -> [T]
{
	if(hijos.isEmpty)
	{
		return []
	}
	else
	{
		return toArray(arbol: hijos[0] )+toArrayBosque(hijos: Array(hijos.dropFirst()))
	}


}

func toArrayFOS<T>(arbol:Arbol<T>) -> [T]
{
	switch arbol
	{
		case let .nodo(x,bosque):
			return bosque.map(toArrayFOS).reduce([x],+)
		case .vacio:
			return []
	}
	
}

// Ejercicio4

func mediafinal(_ a: Double,_ b: Double,_ c:Double) -> Double
{
	return (a*0.34+b*0.33+c*0.33)
}

func imprimirListadosNotas(_ alumnos:[(String, Double, Double, Double, Int)])
{
	print(alumnos.sorted(by: {$0.0 < $1.0}))	// Alfabético Ascendente
	print(alumnos.sorted(by: {$0.1 > $1.1}))	// Parcial1 Descendente
	print(alumnos.sorted(by: {$0.2 < $1.2}))	// Parcial2 Ascendente
	print(alumnos.sorted(by: {$0.3 > $1.3 && $0.4 > $1.4}))	//Año+nota Descendente
	print(alumnos.sorted(by: {mediafinal($0.1,$0.2,$0.3) > mediafinal($1.1,$1.2,$1.3)})) //Final Decreciente

}
//Ejercicio6
func construye(operador: Character) -> (Int, Int) -> Int
{
	func opera(x:Int,y:Int) -> Int
	{
		switch operador
		{
			case "+":
				return x+y
			case "*":
				return x*y
			case "/":
				return x/y
			default:
				return x-y
		}
	}
	return opera
}


