//
//  Modifiers.swift
//  WeatherApp
//
//  Created by Parth Ilasariya on 2021-12-20.
//

import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(8)
            .shadow(color: .init(.sRGB, white: 0, opacity: 0.25), radius: 4, x: 0, y: 4)
    }
}
