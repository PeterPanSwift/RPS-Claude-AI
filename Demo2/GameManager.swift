//
//  GameManager.swift
//  Demo2
//
//  Created by SHIH-YING PAN on 2024/10/31.
//

import SwiftUI

@Observable
final class GameManager {
    private(set) var gameState: GameState
    private(set) var computerSign: Sign?
    private(set) var userSign: Sign?
    private(set) var result: GameResult?
    
    init() {
        self.gameState = .readyToPlay
    }
    
    var isGameOver: Bool {
        gameState == .gameOver
    }
    
    func play(sign: Sign) {
        guard gameState == .readyToPlay else { return }
        
        userSign = sign
        gameState = .playing
        
        Task {
            // Simulate computer thinking
            try? await Task.sleep(for: .seconds(1))
            await MainActor.run {
                computerSign = Sign.allCases.randomElement()
                guard let computerSign else { return }
                result = sign.gameResult(against: computerSign)
                gameState = .gameOver
            }
        }
    }
    
    func playAgain() {
        computerSign = nil
        userSign = nil
        result = nil
        gameState = .readyToPlay
    }
}
