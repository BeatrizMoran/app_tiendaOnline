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

                CarritoView()
                    .tabItem {
                        Label("Carrito", systemImage: "cart")
                    }
        }
        
        }
    }

#Preview {
    ContentView()
}
