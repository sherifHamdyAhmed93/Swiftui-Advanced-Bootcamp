//
//  DragGestureBootcamp.swift
//  Swiftui-Continue-Learning
//
//  Created by Sherif Hamdy on 10/01/2024.
//

import SwiftUI

struct DragGestureBootcamp: View {
    @State var currentOffset:CGSize = .zero
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width:100,height:100)
            .offset(currentOffset)
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
}

struct DragGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBootcamp()
    }
}
