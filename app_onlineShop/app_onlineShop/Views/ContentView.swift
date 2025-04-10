//
//  ContentView.swift
//  App_OnlineShop
//
//  Created by  on 31/3/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        TabView{
                ProductosView()
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
