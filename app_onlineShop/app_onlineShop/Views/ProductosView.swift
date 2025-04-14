import SwiftUI

struct ProductosView: View {
    @StateObject private var viewModel = ProductoListViewModel()
    @State private var selectedProducto: Producto? = nil
    @State private var showDetail = false
    @EnvironmentObject var carrito: Carrito
    @State private var mostrarToast = false

    var body: some View {
        ZStack {
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
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFill()
                                case .failure(_):
                                    Image(systemName: "photo")
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
                        .onTapGesture {
                            selectedProducto = producto
                            withAnimation {
                                showDetail = true
                            }
                        }
                    }
                }
            }

            // Detalle superpuesto
            if let producto = selectedProducto, showDetail {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            showDetail = false
                        }
                    }

                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                showDetail = false
                            }
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title)
                                .foregroundColor(.gray)
                        }
                    }

                    HStack {
                        Spacer()
                        AsyncImage(url: URL(string: producto.image)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                            case .failure(_):
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .frame(height: 200)
                        .cornerRadius(12)
                        Spacer()
                    }

                    Text(producto.title)
                        .font(.title)
                        .fontWeight(.bold)

                    HStack(spacing: 4) {
                        let fullStars = Int(producto.rating.rate)
                        let hasHalfStar = (producto.rating.rate - Double(fullStars)) >= 0.5

                        HStack(spacing: 2) {
                            ForEach(1...5, id: \.self) { index in
                                if index <= fullStars {
                                    Image(systemName: "star.fill")
                                } else if index == fullStars + 1 && hasHalfStar {
                                    Image(systemName: "star.leadinghalf.filled")
                                } else {
                                    Image(systemName: "star")
                                }
                            }
                        }
                        .foregroundColor(.yellow)

                        Text("(\(producto.rating.count) valoraciones)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                    let estaEnCarrito = carrito.elementos.contains { $0.producto.id == producto.id }

                    Button(action: {
                        carrito.agregarElemento(producto)
                        mostrarToast = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            mostrarToast = false
                        }
                    }) {
                        HStack {
                            Text(estaEnCarrito ? "Ya en el carrito" : "Añadir al carrito")
                                .fontWeight(.semibold)
                            Spacer()
                            Text("$\(producto.price, specifier: "%.2f")")
                        }
                        .padding()
                        .background(estaEnCarrito ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                    .disabled(estaEnCarrito)
                    .padding(.top, 10)

                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 20)
                .padding(40)
                .transition(.scale)
            }

            // Toast
            if mostrarToast {
                VStack {
                    Spacer()
                    Text("Producto añadido al carrito 🛒")
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.bottom, 30)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .animation(.easeInOut(duration: 0.3), value: mostrarToast)
                }
            }
        }
        .onAppear {
            viewModel.fetchProductos()
        }
    }
}
