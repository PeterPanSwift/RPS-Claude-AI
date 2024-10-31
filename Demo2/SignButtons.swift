//
//  SignButtons.swift
//  Demo2
//
//  Created by SHIH-YING PAN on 2024/10/31.
//

import SwiftUI

struct SignButtons: View {
    @Environment(GameManager.self) private var gameManager
    @Binding var showResult: Bool
    
    var body: some View {
        HStack(spacing: 30) {
            ForEach(Sign.allCases) { sign in
                Button {
                    withAnimation(.spring) {
                        gameManager.play(sign: sign)
                    }
                } label: {
                    Text(sign.rawValue)
                        .font(.system(size: 50))
                }
                .buttonStyle(.gameSign)
                .opacity(signOpacity(sign: sign))
            }
        }
        .disabled(gameManager.gameState != .readyToPlay)
    }
    
    private func signOpacity(sign: Sign) -> Double {
        guard let userSign = gameManager.userSign else { return 1 }
        return userSign == sign ? 1 : 0.3
    }
}
