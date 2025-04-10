import SwiftUI

class ProductoListViewModel: ObservableObject {
   
    @Published var productos: [Producto] = []

    func fetchProductos() {
        guard let url = URL(string : "\(API.baseURL)/products") else {
            print("URL no válida")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Producto].self, from: data) {
                    // Imprimir en consola para ver los productos
                    print("Productos recibidos: \(decodedResponse)")
                    
                    DispatchQueue.main.async {
                        self.productos = decodedResponse
                    }
                } else {
                    print("Error al decodificar los productos")
                }
            } else if let error = error {
                print("Error en la solicitud: \(error.localizedDescription)")
            }
        }.resume()
    }
}
