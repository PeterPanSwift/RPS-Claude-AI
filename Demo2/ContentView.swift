//
//  ContentView.swift
//  Demo2
//
//  Created by SHIH-YING PAN on 2024/10/31.
//

import SwiftUI

struct ContentView: View {
    @Environment(GameManager.self) private var gameManager
    @State private var showResult = false
    
    var body: some View {
        VStack(spacing: 40) {
            TitleView()
            SignButtons(showResult: $showResult)
            
            if gameManager.gameState == .playing {
                ProgressView()
                    .scaleEffect(1.5)
            }
        }
        .sheet(isPresented: $showResult) {
            ResultView()
        }
        .onChange(of: gameManager.isGameOver) { _, isOver in
            if isOver {
                showResult = true
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(GameManager())
}
