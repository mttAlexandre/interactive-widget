//
//  widgetextension.swift
//  widgetextension
//
//  Created by Alexandre MONTCUIT on 04/07/2023.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    
    let data = DataService()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), count: data.progress())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), count: data.progress())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, count: data.progress())
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let count: Int
}

struct widgetextensionEntryView : View {
    
    @Environment(\.widgetFamily) var widgetFamily
    
    var entry: Provider.Entry
    let data = DataService()
    
    var body: some View {
        HStack {
            
            let color = getColor(value: data.progress())
            
            ZStack {
                CircleView(count: data.progress(), color: color)
                
                VStack {
                    Text(String(data.progress()))
                        .font(.title)
                        .bold()
                        .contentTransition(.numericText())
                }
            }
            
            Spacer()
            
            Button(intent: LogEntryAppIntent()) {
                Text("Add")
                    .font(.title)
                    .bold()
                    .padding()
            }
            .buttonStyle(.bordered)
            .tint(color)
        }
        .padding()
        .containerBackground(.fill.tertiary, for: .widget)
    }
}

struct widgetextension: Widget {
    let kind: String = "widgetextension"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            widgetextensionEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium])
    }
}

#Preview(as: .systemSmall) {
    widgetextension()
} timeline: {
    SimpleEntry(date: .now, count: 3)
}
