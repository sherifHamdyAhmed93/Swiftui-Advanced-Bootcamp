//
//  ScrollViewReaderBootcamp.swift
//  Swiftui-Continue-Learning
//
//  Created by Sherif Hamdy on 10/01/2024.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    @State var textFieldValue:String = ""
    @State var scrollToIndex:Int = 0

    var body: some View {
        VStack {
            TextField("Enter the index to scroll to", text: $textFieldValue)
                .padding(.leading)
                .frame(height: 55)
                .border(.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("Scroll To index") {
                if let index = Int(textFieldValue){
                    scrollToIndex = index
                }
            }
            
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        Text("Item # \(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index) // identifier to scroll to
                    }
                    .onChange(of: scrollToIndex) { newValue in
                        withAnimation(.spring()) {
//                            proxy.scrollTo(newValue)
                            proxy.scrollTo(newValue,anchor: .top)
                        }
                    }
                }
            }
        }
    }
}

struct ScrollViewReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderBootcamp()
    }
}
