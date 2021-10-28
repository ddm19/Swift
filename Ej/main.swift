let equipo1 = Equipo(puntos: 10, nombre: "Hércules")
let equipo2 = Equipo(puntos: 8, nombre: "Villareal")
let equipo3 = Equipo(puntos: 7, nombre: "asd")
let equipo4 = Equipo(puntos: 8, nombre: "sffg")
let equipo5 = Equipo(puntos: 144, nombre: "vfdvg")

var equipos = [equipo1,equipo2,equipo3,equipo4,equipo5]
print(equipos)
equipos.sort()
print(equipos)
print(equipo1 == equipo2) // imprime false
print(equipo1 > equipo2) // imprime true
print("--------------------------- EJERCICIO 2 ---------------------------")
let carrera = Carrera(numCoches: 2, horas: 3)
print(carrera.coches)
print("\nDescripción de la carrera:")
carrera.descripcion()
print("\n!!! Comienza la carrera !!!")
carrera.empezar()
print("\n!!! Clasificación !!!")
carrera.clasificacion()

// EJERCICIO 3
var array: [P] = [A1(), A2()]
for i in array
{
	if let p = i as? A1
	{
		print("p: \(p.p), a1:\(p.a1)")
	}
	if let p = i as? A2
	{
		print("p: \(p.p), a2:\(p.a2)")
	}

  
}

// debe imprimir:
// debe imprimir:
// p: 0, a1: 0
// p: 1, a2: 0

//3b
var vehiculo1 = Vehiculo()
var tren1 = Tren()
tren1.enMarcha = true

let transportes: [TieneVelocidad] = [vehiculo1, tren1]

for i in transportes 
{
    print(i.velocidadActual())
}
//EJERCICIO 4

var t1 = Timer(segundos: 10)
var t2 = Timer(segundos: 5)
for _ in 0...4 {
    t1.paso()
}
for _ in 0...2 {
    t2.paso()
}
var t3 = t1 + t2
t3.paso()
print("Segundos del temporizador 1: \(t1.segundos)")
print("Segundos del temporizador 2: \(t2.segundos)")
print("Segundos del temporizador 3: \(t3.segundos)")
print("Pasos totales: \(Timer.pasosTotales)")
// Imprime:
// Segundos del temporizador 1: 5
// Segundos del temporizador 2: 2
// Segundos del temporizador 3: 6
// Pasos totales: 9

//EJERCICIO 5
let r = Rectangulo(origen:Punto(x:3, y:4), tamaño:Tamaño(ancho:10, alto:5))
let c = Circulo(centro:Punto(x:5, y:0), radio:10.0)
var almacen = AlmacenFiguras()
almacen.añade(figura: r)
almacen.añade(figura: c)
print("Total figuras: \(almacen.cuentaTipos())")