//
//  HomeView.swift
//  ChefDelivery
//
//  Created by lgc on 04/10/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isAnimating = false
    @State private var imageOffSet: CGSize = .zero
    @State private var buttonOffset: CGFloat = 0
    @State private var showSecondScreen = false
    let buttonHeight: CGFloat = 80
    
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
                    .foregroundColor(.yellow)
                    .frame(width: isAnimating ? 400 : 0)
                    .position(
                        x: geometry.size.width / 2,
                        y: geometry.size.height / 2
                    )
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.4 : 0)
                
                
                VStack {
                    Text("Chef Delivery")
                        .font(.system(size: 48))
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
                    
                    
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 60)
                        .padding(isAnimating ? 32 : 92)
                        .opacity(isAnimating ? 1 : 6)
                        .offset(x: imageOffSet.width, y: imageOffSet.height)
                        .gesture(
                            DragGesture()
                                .onChanged{ gesture in
                                    withAnimation(.easeInOut(duration: 0.5)){
                                        imageOffSet = gesture.translation
                                    }
                                }
                                .onEnded{ _ in
                                    withAnimation(.easeInOut(duration: 0.5)){
                                        imageOffSet = .zero
                                    }
                                    
                                }
                        )
                    
                    ZStack {
                        Capsule()
                            .fill(Color("ColorRed").opacity(0.2))
                        
                        Capsule()
                            .fill(Color("ColorRed").opacity(0.2))
                            .padding(9)
                        
                        Text("Descubra mais")
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color("ColorRedDark"))
                            .offset(x: 20)
                        
                        HStack {
                            Capsule()
                                .fill(Color("ColorRed"))
                                .frame(width: buttonOffset + buttonHeight)
                            
                            Spacer()
                        }
                        
                        HStack {
                            ZStack {
                                Circle()
                                    .fill(Color("ColorRed"))
                                
                                Circle()
                                    .fill(Color("ColorRedDark"))
                                    .padding(8)
                                
                                Image(systemName: "chevron.right.2")
                                    .font(.system(size: 24))
                                    .bold()
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    
                                    if gesture.translation.width >= 0 && buttonOffset <= (geometry.size.width - 60) - buttonHeight {
                                        withAnimation(.easeInOut(duration: 0.25)){
                                            buttonOffset = gesture.translation.width
                                        }
                                    }
                                    
                                })
                                .onEnded({ _ in
                                    
                                    if buttonOffset > (geometry.size.width - 60) / 2 {
                                        showSecondScreen = true
                                        
                                    } else {
                                        withAnimation(.easeInOut(duration: 0.25)) {
                                            buttonOffset = 0
                                        }
                                    }
                                })
                        )
                        
                    }
                    .frame(width: geometry.size.width - 60, height: buttonHeight)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : 100)
                    
                    
                }
                .onAppear{
                    withAnimation(.easeInOut(duration: 1.5)) {
                        isAnimating = true
                    }
                }
            }
            .fullScreenCover(isPresented: $showSecondScreen) {
                ContentView()
            }
        }
    }
}

#Preview {
    HomeView()
}
