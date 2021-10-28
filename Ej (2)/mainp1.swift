let array1a = ["anterior", "antígona", "antena"]
let prefijo = "ante"
print("****** Ejercicio 1a ******")	//1a
print(prefijos(prefijo: prefijo, palabras: array1a))
print([true, false, true])

let numeros = [10, 201, 12, 103, 204, 2]
print("****** Ejercicio 1b ******")	//1b
print(parejaMayorParImpar(numeros: numeros))
print((201, 204))

func cuadrado(x: Int) -> Int {
   return x * x
}
print("****** Ejercicio 2a ******")	//2a
print(compruebaParejas([2, 4, 16, 5, 10, 100, 105], funcion: cuadrado))	
print([(2,4), (4,16), (10,100)])
print("****** Ejercicio 2b ******")	//2b
let array2b = [(2,4), (4,14), (4,16), (5,25), (10,100)]
print(coinciden(parejas: array2b, funcion: cuadrado))
print([true, false, true, true, true])

print("****** Ejercicio 3 ******")	//3
let movimientos: [Movimiento] = [.deposito(830.0), .cargoRecibo("Gimnasio", 45.0), .deposito(400.0), .cajero(100.0), .cargoRecibo("Fnac", 38.70)]
print(aplica(movimientos: movimientos))
print(1046.3, ["Gimnasio", "Fnac"])

print("****** Ejercicio 4 ******")	//4
let arbol: ArbolBinario = .nodo(8, 
                                .nodo(2, .vacio, .vacio), 
                                .nodo(12, .vacio, .vacio))

print(sumab(arbolb: arbol))
print(22)

print("****** Ejercicio 5 ******")	//5

/*
Definimos el árbol

    10
   / | \
  3  5  8
  |
  1

*/

let arbol1 = Arbol.nodo(1, [])
let arbol3 = Arbol.nodo(3, [arbol1])
let arbol5 = Arbol.nodo(5, [])
let arbol8 = Arbol.nodo(8, [])
let arbol10 = Arbol.nodo(10, [arbol3, arbol5, arbol8])

func esPar(x: Int) -> Bool {
    return x % 2 == 0
}

print("La suma del árbol es: \(suma(arbol: arbol10, cumplen: esPar))")
print("La suma del árbol es: "+"18")