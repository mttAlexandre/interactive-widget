//
//  DataService.swift
//  InteractiveWidget
//
//  Created by Alexandre MONTCUIT on 04/07/2023.
//

import Foundation
import SwiftUI

struct DataService {
    
    @AppStorage("count", store: UserDefaults(suiteName: "group.com.perso.InteractiveWidget"))
    private var count = 0
    
    func log() {
        count += 1
    }
    
    func progress() -> Int { count }
}
