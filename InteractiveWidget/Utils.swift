//
//  Utils.swift
//  InteractiveWidget
//
//  Created by Alexandre MONTCUIT on 04/07/2023.
//

import Foundation
import SwiftUI

// this file is shared with widget target

private let colors: [Color] = [.green, .yellow, .orange, .red, .pink, .purple]

func getColor(value: Int) -> Color {
    let isFull = value != 0 && value % 3 == 0
    let index = Int(floor(Double(value / 3)))
    return index < colors.count ? colors[isFull ? index-1 : index] : colors.last!
}
