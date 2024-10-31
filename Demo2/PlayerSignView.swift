//
//  PlayerSignView.swift
//  Demo2
//
//  Created by SHIH-YING PAN on 2024/10/31.
//

import SwiftUI

struct PlayerSignView: View {
    let emoji: String
    let sign: String
    let label: String
    
    var body: some View {
        VStack(spacing: 10) {
            Text(emoji)
                .font(.largeTitle)
            Text(sign)
                .font(.title)
            Text(label)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}
