//
//  CartModel.swift
//  App_OnlineShop
//
//  Created by  on 31/3/25.
//
import SwiftUI

class Carrito: ObservableObject {
    // Guarda el carrito cada vez que cambia
    @Published var elementos: [ElementoCarrito] = [] {
        didSet {
            guardarCarrito()
        }
    }
    
    init() {
            cargarCarrito()  // Cargar el carrito desde UserDefaults cuando se crea la instancia
        }
    
    func agregarElemento(_ producto: Producto) {     
        if let index = elementos.firstIndex(where: { $0.producto.id == producto.id }) {
            elementos[index].cantidad += 1
        } else {
            elementos.append(ElementoCarrito(id: producto.id, producto: producto, cantidad: 1))
        }
    }
        
    func precioTotal() -> Double {
        return elementos.reduce(0) { $0 + ($1.producto.price * Double($1.cantidad)) }
    }
    
    func eliminarElemento(id: Int) {
        if let index = elementos.firstIndex(where: { $0.id == id }) {
            elementos.remove(at: index)
        }
    }
    
    func modificarCantidad(id: Int, cantidad: Int) {
            if let index = elementos.firstIndex(where: { $0.id == id }) {
                if cantidad > 0 {
                    elementos[index].cantidad = cantidad
                } else {
                    eliminarElemento(id: id)
                }
            }
        }
    
    private func cargarCarrito() {
            if let data = UserDefaults.standard.data(forKey: "carrito_guardado") {
                let decoder = JSONDecoder()
                do {
                    let elementosCargados = try decoder.decode([ElementoCarrito].self, from: data)
                    self.elementos = elementosCargados
                } catch {
                    print("Error al cargar carrito: \(error.localizedDescription)")
                }
            }
        }
    
    //PERSISTENCIA
    
    private func guardarCarrito(){
        do{
            let data = try JSONEncoder().encode(elementos)
            UserDefaults.standard.set(data, forKey: "carrito_guardado")
        } catch {
            print("Error al guardar carrito: \(error.localizedDescription)")

        }
    }
}
