//
//  ContentView.swift
//  App_OnlineShop
//
//  Created by  on 31/3/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var carrito = Carrito()
    
    var totalUnidadesEnCarrito: Int {
        carrito.elementos.reduce(0) { $0 + $1.cantidad }
    }
    
    
    var body: some View {
        
        
        TabView{
            ProductosView()
                .environmentObject(carrito)
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            PerfilView()
                .tabItem {
                    Label("Perfil", systemImage: "person.circle")
                }

            CarritoView(carrito: carrito)
                .badge(totalUnidadesEnCarrito)
                .tabItem {
                    Label("Carrito", systemImage: "cart")
                }
        }
    }
}

#Preview {
    ContentView()
}
