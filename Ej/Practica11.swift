import Foundation
//1a 
/*protocol A {
    var a: String {get}
    func foo(a: String) -> String?
}
protocol B {
    mutating func bar()
}
struct MiStruct: A, B 
{
    var a = String()

		func foo(a: String) -> String?
		{
			let b = a.self != a ? a:a.self

			return b
		}
		mutating func bar()
		{
		}
}*/
//1b
protocol A 
{
    var a: Int {get set}
    func foo(a: Int, b: Int) -> Int?
}

protocol B 
{
    mutating func bar()
}

struct MiStruct: A, B {
    var a = 10
    func foo(a: Int, b: Int) -> Int? 
		{
        let res = a > 10 ? a: b
        return res
    }
		mutating func bar()
		{

		}
}
//1c
struct Equipo : Equatable 
{

    let puntos: Int
    let nombre: String
}
extension Equipo : Comparable
{
	static func < (a : Equipo , b: Equipo) -> Bool
	{
		return a.puntos < b.puntos
	}
}

//2a

enum MarcaCoche : Int
{
	case Mercedes = 0, Ferrari, RedBull, McLaren

	static func random() -> MarcaCoche
	{
		let r = Int.random(in: 0...McLaren.rawValue)

		return MarcaCoche(rawValue: r)!
	}
}
enum TipoCambio : Int
{
	case Automatico = 0, Manual

	static func random() -> TipoCambio
	{
		let r = Int.random(in: 0...Manual.rawValue)

		return TipoCambio(rawValue: r)!
	}
}
class Coche
{
	var velocidadActual,distanciaRecorrida : Double
	var marcha : Int
	var marca : MarcaCoche
	
	static let velocidadMaxima : Double = 150.0
	static let marchaMaxima : Int = 6

	var descripcion : String
	{
		return "\(marca)"
	}
	
	init(velocidadActual: Double,distanciaRecorrida:Double,marcha:Int,marca:MarcaCoche)
	{
		self.velocidadActual = velocidadActual
		self.distanciaRecorrida = distanciaRecorrida
		self.marcha = marcha
		self.marca = marca
	}

}
class CocheAutomatico : Coche
{
	override var descripcion : String
	{
		return super.descripcion + " Automático"
	}
	override var velocidadActual : Double 
	{
		didSet
		{
			marcha = min(Int(velocidadActual / 25.0) + 1, 5)
			distanciaRecorrida += velocidadActual
			print("\(descripcion) viajando a \(velocidadActual) kilómetros por hora con la marcha \(marcha)")

		}
	}
}
class CocheManual : Coche
{
	override var descripcion : String
	{
		return super.descripcion + " Manual"
	}
	override var marcha : Int
	{
		didSet
		{
			velocidadActual = 25.0 * Double(marcha)
			distanciaRecorrida += velocidadActual
			print("\(descripcion) viajando a \(velocidadActual) kilómetros por hora con la marcha \(marcha)")
		}
	}
}
class Carrera
{
	var numCoches : Int
	var horas : Int

	var coches : [Coche] = []
	
	func descripcion()
	{
		print("\(numCoches) coches con una duración de \(horas) horas")
		for c in coches
		{
			print(c)
		}
	}
	func empezar()
	{
		let horainicio = horas

		while horas > 0
		{
			horas -= 1
			print("Horas transcurridas \(horainicio-horas)")
			for c in coches
			{
				if (c is CocheAutomatico)
				{
					c.velocidadActual = Double(Int.random(in: 1...Int(Coche.velocidadMaxima)))
				}
				else if c is CocheManual
				{
					c.marcha = Int.random(in: 1...Coche.marchaMaxima)
										
				}
			}
		}
	}
	func clasificacion()
		{
			coches.sort(by: { $0.distanciaRecorrida > $1.distanciaRecorrida })
			var i = 0
			for c in coches
			{
				i += 1
				print("\(i).\(c.descripcion) (\(c.distanciaRecorrida) kilómetros recorridos)")
			}
		}


	init(numCoches : Int, horas: Int)
	{
		self.numCoches = numCoches
		self.horas = horas

		var i = 0
		while i < numCoches
		{
			let tipo = TipoCambio.random()
			switch (tipo)
			{
				case .Automatico:
					coches.append(CocheAutomatico(velocidadActual: 0.0,distanciaRecorrida:0.0,marcha:0,marca:MarcaCoche.random()))
				case .Manual:
					coches.append(CocheManual(velocidadActual: 0.0,distanciaRecorrida:0.0,marcha:0,marca:MarcaCoche.random()))
			}
			i += 1
		}

	}
}
//--3a
protocol P {
   var p: Int { get }
}
class A1: P {
   var p = 0
   var a1 = 0
}
class A2: P {
   var p = 1
   var a2 = 0
}
//--3b
protocol TieneVelocidad {
    func velocidadActual () -> Double
}

class Vehiculo 
{
    var velocidad = 0.0
    func velocidadActual() -> Double {
        return velocidad
    }
}

class Tren 
{
    static let velocidadEnMarcha = 300.0
    var pasajeros = 0
    var enMarcha = false
}

extension Vehiculo : TieneVelocidad
{
}
extension Tren : TieneVelocidad
{
	func velocidadActual () -> Double
	{
		var velocidad = 0.0
		if self.enMarcha
		{
			velocidad = Tren.velocidadEnMarcha
		}
		return velocidad
	}
}

// Ejercicio 4

struct Timer
{
	var segundos : Int
	
	static var pasosTotales : Int = 0

	mutating func paso()
	{
		segundos -= 1
		Timer.pasosTotales += 1
	}
	
	static func + (tm1 : Timer, tm2: Timer) -> Timer
	{
		return Timer(segundos:tm1.segundos+tm2.segundos)
	}
}

// EJERCICIO 5
//

struct Punto {
    var x = 0.0, y = 0.0
}

struct Tamaño {
    var ancho = 0.0, alto = 0.0
}

struct Circulo
{
    var centro = Punto()
    var radio = 0.0

    var area: Double 
		{
			get
			{
				return Double.pi * (radio*radio)
			}
			set
			{
				radio = sqrt(Double.pi/newValue)
			}
        // Propiedad calculada que devuelve el 
        // área del círculo y modifica el radio	//Done
        // cuando se actualiza
    }
}

struct Rectangulo
{
    var origen = Punto()
    var tamaño = Tamaño()

    var centro: Punto 
		{
			get
			{
				return Punto(x: origen.x+tamaño.ancho/2 , y: origen.y+tamaño.alto/2)
			}
			set
			{
				let incx = newValue.x - origen.x
				let incy = newValue.y - origen.y

				origen = Punto(x: origen.x+incx,y:origen.y+incy)
			}
        // Propiedad calculada que devuelve el 
        // centro del rectángulo y traslada su //Done
        // origen cuando se modifica
    }

    var area: Double 
		{
			return tamaño.alto*tamaño.ancho
        // Propiedad calculada que devuelve el
        // área del rectángulo
    }
}

protocol Figura
{
	var centro : Punto {get set}
	var area : Double {get}
	var tamaño : Tamaño{get}

}
extension Rectangulo : Figura
{

}
extension Circulo : Figura
{
	var tamaño : Tamaño
	{
		get 
		{
			return Tamaño(ancho:self.radio,alto:self.radio)
		}
		set
		{
			self.radio = newValue.alto
		}
	}
}
extension Figura
{
	var descripcion : String
	{
		get 
		{
			return "\(centro),\(area)"
		}
	}
}
struct AlmacenFiguras
{
	var figuras : [Figura] = []

	mutating func añade(figura: Figura)
	{
		figuras.append(figura)
	}
	var numFiguras : Int
	{
		get 
		{
			return figuras.count
		}
	}
	var areaTotal : Double
	{
		get
		{
			var areat : Double = 0
			for f in figuras
			{
				areat += f.area
			}
			return areat
		}
	}
	func cuentaTipos() -> (Int,Int)
	{
		var ncirc : Int = 0
		var nrect : Int = 0
		for f in figuras
		{
			if f is Circulo
			{
				ncirc += 1
			}
			else if f is Rectangulo
			{
				nrect += 1
			}
		}

		return (ncirc,nrect)
	}
}