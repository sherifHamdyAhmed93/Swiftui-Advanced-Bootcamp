//
//  DragGestureBootcamp2.swift
//  Swiftui-Continue-Learning
//
//  Created by Sherif Hamdy on 10/01/2024.
//

import SwiftUI

struct DragGestureBootcamp2: View {
    @State var currentOffset:CGSize = .zero
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width:300,height:500)
            .offset(currentOffset)
            .scaleEffect(getScaleAmount())
            .rotationEffect(Angle(degrees: getRotationAmount()))
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        withAnimation(Animation.spring()) {
                            currentOffset = value.translation
                        }
                    })
                    .onEnded({ value in
                        withAnimation(Animation.spring()) {
                            currentOffset = .zero
                        }
                    })
            )
    }
    
    func getScaleAmount()->CGFloat{
        let max = UIScreen.main.bounds.width/2
        let width = abs(currentOffset.width)
        let percentage = width/max
        let scaleAmount = min(0.5, percentage)
        return 1 - scaleAmount * 0.5
    }
    
    func getRotationAmount()->Double{
        let max = UIScreen.main.bounds.width/2
        let currentAmount = currentOffset.width
        let percentage = currentAmount/max
        let angleAmountAsDouble:Double = Double(percentage)
        let maxAngle : Double = 10
        return angleAmountAsDouble * maxAngle
    }
}

struct DragGestureBootcamp2_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBootcamp2()
    }
}
