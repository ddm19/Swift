print("***** Ejercicio1a ******")

let res1 = maxOpt(nil, nil) 
let res2 = maxOpt(10, nil)
let res3 = maxOpt(-10, 30)
print("res1 = \(String(describing: res1))")
print("res2 = \(String(describing: res2))")
print("res3 = \(String(describing: res3))")
print("---")
print("res1 = nil")
print("res2 = Optional(10)")
print("res3 = Optional(30)")


print("****** Ejercicio 1b1 ******")	//1b1

let numeros1b = [-10, 202, 12, 100, 204, 2]
print(parejaMayorParImpar(numeros: numeros1b))
print("(nil, Optional(204))")

print("---")

let numeros1b2 = [-235,3,7,13,21]
print(parejaMayorParImpar(numeros: numeros1b2))
print("(Optional(21), nil)")

print("****** Ejercicio 1b2 ******")	//1b2

let numeros2 = [-10, 202, 12, 100, 204, 2]
print(sumaMaxParesImpares(numeros: numeros2))
print(204)

print("****** Ejercicio c ******")	//1b2
print(sumac(palabras:["En", "un", "lugar", "de", "La", "Mancha"],contienen:"a"))
print(13)

print("****** Ejercicio c2 ******")	//1b2
print(sumaMenoresMayores(nums:[2, 3, 4, 5],pivote:4))
print((5,9))

print("****** Ejercicio c2 ******")	//1b2
var x = 5
let g = foo()
bar(f: g)
print(9)
bar(f: g)
print(15)

print("****** Ejercicio 3 ******")	//1b2

let arbolInt: Arbol = .nodo(53, 
                            [.nodo(13, []), 
                             .nodo(32, []), 
                             .nodo(41, 
                                   [.nodo(36, []), 
                                    .nodo(39, [])
                                   ])
                            ])
let arbolString: Arbol = .nodo("Zamora", 
                               [.nodo("Buendía", 
                                      [.nodo("Albeza", []), 
                                       .nodo("Berenguer", []), 
                                       .nodo("Bolardo", [])
                                      ]), 
                                .nodo("Galván", [])
                               ])

print(toArray(arbol: arbolInt))
print([53, 13, 32, 41, 36, 39])
print(toArrayFOS(arbol: arbolString))
print(["Zamora", "Buendía", "Albeza", "Berenguer", "Bolardo", "Galván"])

let listaAlumnos = [("Pepe", 8.45, 3.75, 6.05, 1), 
                    ("Maria", 9.1, 7.5, 8.18, 1), 
                    ("Jose", 8.0, 6.65, 7.96, 1),
                    ("Carmen", 6.25, 1.2, 5.41, 2), 
                    ("Felipe", 5.65, 0.25, 3.16, 3), 
                    ("Carla", 6.25, 1.25, 4.23, 2), 
                    ("Luis", 6.75, 0.25, 4.63, 2), 
                    ("Loli", 3.0, 1.25, 2.19, 3)]
//imprimirListadosNotas(listaAlumnos)

print(listaAlumnos.filter{$0.1 >= 5 && $0.2 <= 5})

print(listaAlumnos.filter{mediafinal($0.1,$0.2,$0.3) >= 3})

var tupla = listaAlumnos.reduce((0,0,0), { (result,alumno) in 
return (result.0 + alumno.1,result.1 + alumno.2,result.2 + alumno.3)})

tupla = (tupla.0 / Double(listaAlumnos.count), tupla.1 / Double(listaAlumnos.count), tupla.2 / Double(listaAlumnos.count))
print(tupla)
// Resultado: (6.6812499999999995, 2.7624999999999997, 5.2262500000000003)

var f = construye(operador: "+")
print(f(2,3))
print(5)
f = construye(operador: "-")
print(f(2,3))
print(-1)