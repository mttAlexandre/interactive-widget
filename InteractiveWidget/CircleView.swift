//
//  CircleView.swift
//  InteractiveWidget
//
//  Created by Alexandre MONTCUIT on 04/07/2023.
//

import SwiftUI

// this file is shared with widget target
struct CircleView: View {
    
    let count: Int
    let color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.primary.opacity(0.2),
                        lineWidth: 20)
            
            let trimEnd: Double = {
                if count == 0 { return 0.0 }
                if count % 3 == 0 { return 1.0 }
                
                let ratio = Double(count) / 3.0
                return ratio - floor(ratio)
            }()
            
            Circle()
                .trim(from: 0.0, to: trimEnd)
                .stroke(color,
                        style: StrokeStyle(lineWidth: 10,
                                           lineCap: .round,
                                           lineJoin: .round))
            // to start at the to of the circle
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.5), value: trimEnd)
        }
    }
}

#Preview {
    VStack{
        CircleView(count: 0, color: .green)
        CircleView(count: 3, color: .green)
        CircleView(count: 5, color: .red)
    }
}
