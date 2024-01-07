//
//  MagnificationGestureBootcamp.swift
//  Swiftui-Continue-Learning
//
//  Created by Sherif Hamdy on 07/01/2024.
//

import SwiftUI

struct MagnificationGestureBootcamp: View {
    
    @State var currentAmount:CGFloat = 0
    @State var lastAmount:CGFloat = 0

    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .font(.title)
//            .padding(40)
//            .background(Color.red.cornerRadius(10))
//            .scaleEffect(1 + currentAmount + lastAmount)
//            .gesture(
//                MagnificationGesture()
//                    .onChanged({ value in
//                        currentAmount = value - 1
//                        print("onChange : \(value)")
//                    })
//                    .onEnded({ value in
//                        print("onEnd : \(currentAmount)")
//
//                        lastAmount += currentAmount
//                        currentAmount = 0
//                    })
//            )
        
        VStack(spacing: 10.0){
            HStack{
                Circle().frame(width: 35, height: 35)
                
                Text("SwiftUI Thinking")
                
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            
            Rectangle()
                .frame(height: 300)
                .scaleEffect(1+currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged({ value in
                            currentAmount  = value - 1
                        })
                        .onEnded({ _ in
                            withAnimation(.spring()) {
                                currentAmount = 0
                            }
                        })
                )
            
            HStack(){
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)

            
            Text("This is caption for my photo!")
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal)
        }
        
        
    }
}

struct MagnificationGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureBootcamp()
    }
}
