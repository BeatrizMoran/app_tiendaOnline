//
//  ProductosView.swift
//  App_OnlineShop
//
//  Created by  on 7/4/25.
//

import SwiftUI

struct ProductosView: View {
    var body: some View {
        VStack {
            
            HStack{
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
                    
                HStack (alignment: .center, spacing: 16){
                        Image(systemName: "calendar")
                            .resizable()
                            .foregroundStyle(.black)
                            .opacity(0.5)
                            .scaledToFit()
                            .frame(height: 150)
                            .cornerRadius(10)
                            .padding(.bottom, 8)
                        
                        VStack(alignment: .leading) {
                            Text("Titulo")
                                .font(.headline)
                                .foregroundStyle(Color(.black))
                                .foregroundColor(.primary)
                            
                            Text("$Precio")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                    Divider()
                    .padding(.horizontal, 25)
                }
            }
    }
}
