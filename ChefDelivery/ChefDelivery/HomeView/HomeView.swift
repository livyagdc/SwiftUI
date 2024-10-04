//
//  HomeView.swift
//  ChefDelivery
//
//  Created by lgc on 04/10/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var isAnimating = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
//                Circle()
//                    .foregroundColor(Color("ColorRed"))
//                    .frame(width: isAnimating ? 400 : 0)
//                    .position(x: 200, y: 400)
//                    .blur(radius: 60)
//                    .opacity(isAnimating ? 0.5 : 0)
                
                Circle()
                    .foregroundColor(Color("ColorRedDark"))
                    .frame(width: isAnimating ? 400 : 0)
                    .position(
                        x: geometry.size.width / 2,
                        y: geometry.size.height / 2
                    )
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.4 : 0)
                
                
                VStack {
                    Text("Chef Delivery")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("ColorRed"))
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : -40)
                    
                    Text("Peça as suas comidas favoritas no conforto da sua casa.")
                        .font(.title2)
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black.opacity(0.7))
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : -40)
                    
                    Spacer()
                    
                }
                .onAppear{
                    withAnimation(.easeInOut(duration: 1.5)) {
                        isAnimating = true
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
