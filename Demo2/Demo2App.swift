//
//  Demo2App.swift
//  Demo2
//
//  Created by SHIH-YING PAN on 2024/10/31.
//

import SwiftUI

@main
struct Demo2App: App {
    private var gameManager = GameManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(gameManager)
        }
    }
}
