//
//  ContentView.swift
//  App_OnlineShop
//
//  Created by  on 31/3/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var carrito = Carrito()
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
                            .tabItem {
                                Label("Carrito", systemImage: "cart")
                                    .badge(carrito.elementos.count) // Siempre mostramos el número
                            }
                        }
                    }
                        }

#Preview {
ContentView()
}
