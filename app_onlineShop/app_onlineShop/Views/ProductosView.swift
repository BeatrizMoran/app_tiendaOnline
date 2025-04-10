//
//  ProductosView.swift
//  App_OnlineShop
//
//  Created by  on 7/4/25.
//

import SwiftUI

struct ProductosView: View {
    @StateObject private var viewModel = ProductoListViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "basket.fill")
                    .resizable()
                    .foregroundStyle(Color.white)
                    .scaledToFit()
                    .frame(height: 50)
                    .cornerRadius(10)
                    .padding(.bottom, 8)

                Text("Productos")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .font(.system(size: 26, weight: .bold))
                    .padding()
                    .cornerRadius(10)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.blue)

            NavigationStack {
                List(viewModel.productos) { producto in
                    HStack(spacing: 16) {
                        AsyncImage(url: URL(string: producto.image)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView() // Cargando...
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                            case .failure(_):
                                Image(systemName: "photo") // Imagen por defecto si falla
                                    .resizable()
                                    .scaledToFill()
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .frame(width: 60, height: 60)
                        .cornerRadius(10)
                        .clipped()

                        VStack(alignment: .leading) {
                            Text(producto.title)
                                .font(.headline)

                            Text("$\(producto.price, specifier: "%.2f")")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 8)
                }
                
            }
            
        }
        .onAppear {
            viewModel.fetchProductos()
        }
    }
}
