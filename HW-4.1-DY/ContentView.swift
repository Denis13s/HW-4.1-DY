//
//  ContentView.swift
//  HW-4.1-DY
//
//  Created by Denis Yarets on 13/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var opacityRed: CGFloat = 1
    @State private var opacityYellow: CGFloat = 0.3
    @State private var opacityGreen: CGFloat = 0.3
    
    var body: some View {
        
        VStack(spacing: 0) {
            GeometryReader { proxy in
                let width = proxy.size.width / 3
                
                VStack(spacing: 10) {
                    MyCircle(colorFG: .red, opacity: $opacityRed)
                    MyCircle(colorFG: .yellow, opacity: $opacityYellow)
                    MyCircle(colorFG: .green, opacity: $opacityGreen)
                }
                .frame(width: width)
                .offset(x: proxy.frame(in: .local).midX - width / 2)
            }
            
            Button { changeColor() } label: {
                Text("Next")
                    .font(.title)
                    .tint(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.blue)
                            .stroke(Color.white, lineWidth: 1)
                    }
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.8))
        
    }
}

private extension ContentView {
    func changeColor() {
        if opacityRed == 1 {
            withAnimation {
                opacityRed = 0.3
                opacityYellow = 1
            }
        } else if opacityYellow == 1 {
            withAnimation {
                opacityYellow = 0.3
                opacityGreen = 1
            }
        } else {
            withAnimation {
                opacityGreen = 0.3
                opacityRed = 1
            }
        }
    }
}

#Preview {
    ContentView()
}

struct MyCircle: View {
    
    let colorFG: Color
    
    @Binding var opacity: CGFloat
    
    var body: some View {
        Circle()
            .fill(colorFG.opacity(opacity))
            .stroke(Color.white, lineWidth: 1)
    }
}
