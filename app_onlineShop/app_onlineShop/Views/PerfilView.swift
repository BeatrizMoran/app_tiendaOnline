//
//  PerfilView.swift
//  App_OnlineShop
//
//  Created by  on 7/4/25.
//

import SwiftUI

struct PerfilView: View {
    var body: some View {
            VStack(spacing: 0) {
                HStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .foregroundStyle(Color.white)
                        .scaledToFit()
                        .frame(height: 50)
                        .cornerRadius(10)
                        .padding(.bottom, 8)

                    Text("Perfil")
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

                
                VStack {
                    Text("Perfil en desarrollo")
                        .foregroundColor(.primary)
                        .font(.system(size: 22, weight: .medium))
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(.systemBackground))
            }
            .ignoresSafeArea(edges: .top)
        }
    }
}
