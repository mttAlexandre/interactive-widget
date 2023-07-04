//
//  LogEntryAppIntent.swift
//  widgetextensionExtension
//
//  Created by Alexandre MONTCUIT on 04/07/2023.
//

import Foundation
import AppIntents

// https://developer.apple.com/documentation/appintents/providing-your-app-s-capabilities-to-system-services

struct LogEntryAppIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Log an entry to your count."
    
    static var description =
    IntentDescription("Increase the count value.")
    
    func perform() async throws -> some IntentResult & ReturnsValue {
        let data = DataService()
        data.log()
        
        return .result(value: data.progress())
    }
    
}
