struct ResultView: View {
    @Environment(GameManager.self) private var gameManager
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Game Result")
                .font(.title)
                .fontWeight(.bold)
            
            HStack(spacing: 40) {
                PlayerSignView(
                    emoji: "🧑🏻‍💻",
                    sign: gameManager.userSign?.rawValue ?? "",
                    label: "You"
                )
                
                Text("VS")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                PlayerSignView(
                    emoji: "🤖",
                    sign: gameManager.computerSign?.rawValue ?? "",
                    label: "Computer"
                )
            }
            
            if let result = gameManager.result {
                Text(result.rawValue)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(resultColor(for: result))
            }
            
            Button("Play Again") {
                withAnimation(.spring) {
                    gameManager.playAgain()
                    dismiss()
                }
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            .tint(.blue)
        }
        .padding()
    }
    
    private func resultColor(for result: GameResult) -> Color {
        switch result {
        case .win: .green
        case .lose: .red
        case .draw: .orange
        }
    }
}