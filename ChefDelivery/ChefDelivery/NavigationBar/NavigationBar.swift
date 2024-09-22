//
//  NavigationBar.swift
//  ChefDelivery
//
//  Created by lgc on 21/09/24.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack{
            
            Spacer()
            
            Button("R. Vergueiro, 3185") {
                
            }
            .font(.subheadline)
            .fontWeight(.bold)
            .foregroundColor(.black)
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "bell")
                    .font(.title3)
                    .foregroundColor(.red)
            }
            
        }
    }
}

#Preview {
    NavigationBar()
        .previewLayout(.sizeThatFits)
        .padding()
}
