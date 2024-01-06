//
//  LongPanGestureBootcamp.swift
//  Swiftui-Continue-Learning
//
//  Created by Sherif Hamdy on 06/01/2024.
//

import SwiftUI

struct LongPanGestureBootcamp: View {
    @State var isComplete = false
    @State var isSuccess = false

    var body: some View {
        
        
        VStack{
            Rectangle()
                .fill(isComplete ? .green : .blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity,alignment: .leading)
                .background(.gray)
            
            HStack{
                Text("Click Here".uppercased())
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) {
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    } onPressingChanged: { isPressing in
                        if isPressing{
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isComplete = true
                            }
                        }else{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                                if !isSuccess{
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                    }
                                }
                            })
                        }
                    }

                
                Text("reset".uppercased())
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
        }
        
        
//        Text(isComplete ? "Completed" : "Not Completed")
//            .padding()
//            .background(isComplete ? .green : .gray)
//            .cornerRadius(10)
//            .onLongPressGesture {
//                isComplete.toggle()
//            }
    }
}

struct LongPanGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LongPanGestureBootcamp()
    }
}
