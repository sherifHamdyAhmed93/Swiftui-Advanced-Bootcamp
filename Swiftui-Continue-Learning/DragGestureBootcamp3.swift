//
//  DragGestureBootcamp3.swift
//  Swiftui-Continue-Learning
//
//  Created by Sherif Hamdy on 10/01/2024.
//

import SwiftUI

struct DragGestureBootcamp3: View {
    
    @State var startOffestY:CGFloat = UIScreen.main.bounds.height * 0.85
    @State var currentOffestY:CGFloat = 0
    @State var endOffestY:CGFloat = 0

    @State var middleOffest:CGFloat = UIScreen.main.bounds.height / 2

    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
            
            MySignupView()
                .offset(y:startOffestY)
                .offset(y:currentOffestY)
                .offset(y:endOffestY)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            withAnimation(.spring()) {
                                currentOffestY = value.translation.height
                            }
                        })
                        .onEnded({ value in
                            withAnimation(.spring()) {
                                if currentOffestY < -middleOffest{
                                    endOffestY = -startOffestY
                                    currentOffestY = 0
                                }else if currentOffestY > middleOffest && endOffestY != 0{
                                    endOffestY = 0
                                    currentOffestY = 0
                                }else{
                                    currentOffestY = 0
                                }
                            }
                        })
                )
            
            Text("\(currentOffestY)")
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct DragGestureBootcamp3_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBootcamp3()
    }
}

struct MySignupView: View {
    var body: some View {
        VStack(spacing: 20.0){
            Image(systemName: "chevron.up")
                .padding(.top)
            
            Text("Sign UP")
                .font(.headline)
                .fontWeight(.semibold)
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("This is the description for our app.this is my favorite swiftui app and i recommend to all of my friends to subscribe to swiftui thinking!!")
                .multilineTextAlignment(.center)
                .padding()
            
            Text("Create An Account")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(Color.black.cornerRadius(10))
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(30)
    }
}
