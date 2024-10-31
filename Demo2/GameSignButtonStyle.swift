//
//  GameSignButtonStyle.swift
//  Demo2
//
//  Created by SHIH-YING PAN on 2024/10/31.
//

import SwiftUI

struct GameSignButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(
                Circle()
                    .fill(.ultraThinMaterial)
                    .shadow(radius: 5)
            )
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

extension ButtonStyle where Self == GameSignButtonStyle {
    static var gameSign: GameSignButtonStyle {
        GameSignButtonStyle()
    }
}
