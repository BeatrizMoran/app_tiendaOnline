//
//  CarritoViewModel.swift
//  App_OnlineShop
//
//  Created by  on 7/4/25.
//
import Foundation

class CarritoViewModel: ObservableObject {
    @Published var carrito: Carrito = Carrito()
    
    func agregarProductoAlCarrito(producto: Producto) {
            carrito.agregarElemento(producto)
        }
        
    func precioTotal() -> Double {
        return carrito.precioTotal()
    }
    
    func eliminarProductoDelCarrito(id: Int) {
        carrito.eliminarElemento(id: id)
    }
}
