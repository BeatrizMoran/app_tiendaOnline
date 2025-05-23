//
//  CarritoView.swift
//  App_OnlineShop
//
//  Created by  on 7/4/25.
//


import SwiftUI

struct CarritoView: View {
    @ObservedObject var carrito: Carrito

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

                Text("Carrito")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .font(.system(size: 26, weight: .bold))
                    .padding()
                    .cornerRadius(10)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.blue)

            if carrito.elementos.isEmpty {
                Spacer()
                Text("Tu carrito está vacío")
                    .font(.title3)
                    .foregroundColor(.gray)
                Spacer()
            } else {
                List {
                    ForEach(carrito.elementos) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.producto.title)
                                    .font(.headline)
                                Text("Precio: \(item.producto.price, specifier: "%.2f") €")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()

                            VStack{
                                // Botón de disminuir cantidad
                                Button(action: {
                                    
                                }) {
                                    Image(systemName: "minus.circle.fill")
                                        .foregroundColor(.red)
                                        
                                }.onTapGesture {
                                    carrito.modificarCantidad(id: item.id, cantidad: item.cantidad - 1)
                                }
                            }
                            
                            Text("x\(item.cantidad)")
                                .font(.headline)
                                .padding(.horizontal)

                            VStack{
                                // Botón de aumentar cantidad
                                Button(action: {
                                    
                                }) {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(.green)
                                        
                                }.onTapGesture {
                                    carrito.modificarCantidad(id: item.id, cantidad: item.cantidad + 1)
                                }
                            }
                            
                            
                        }
                        .padding(.vertical, 4)
                        
                        
                            
                        
                        
                        
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            carrito.eliminarElemento(id: carrito.elementos[index].id)
                        }
                    }
                }

                // Total del carrito
                Text("Total: \(carrito.precioTotal(), specifier: "%.2f") €")
                    .font(.title2)
                    .bold()
                    .padding()
            }
        }
        .navigationTitle("Carrito")
    }
}
