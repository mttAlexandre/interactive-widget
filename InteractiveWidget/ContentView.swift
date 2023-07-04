//
//  ContentView.swift
//  InteractiveWidget
//
//  Created by Alexandre MONTCUIT on 04/07/2023.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    
    @AppStorage("count", store: UserDefaults(suiteName: "group.com.perso.InteractiveWidget")) var count = 0
    
    var body: some View {
        VStack {
            Text("Hello, Interactive Widget!")
                .font(.title)
            
            Spacer()
            
            let color = getColor(value: count)
            
            ZStack {
                CircleView(count: count, color: color)
                
                VStack {
                    Text("Count")
                        .font(.largeTitle)
                    
                    Text(String(count))
                        .font(.system(size: 80))
                        .bold()
                }
            }
            .padding()
            .padding()
            
            Spacer()
            
            Button {
                count += 1
                updateWidget()
            } label: {
                Text("Add")
                    .bold()
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(color)
            
            Button {
                count = 0
                updateWidget()
            } label: {
                Text("Reset")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
            
        }
        .padding()
    }
    
    private func updateWidget() {
        WidgetCenter.shared.reloadTimelines(ofKind: "widgetextension")
    }
}

#Preview {
    ContentView()
}
