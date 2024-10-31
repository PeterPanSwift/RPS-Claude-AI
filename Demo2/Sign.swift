enum Sign: String, CaseIterable, Identifiable {
    case rock = "👊"
    case paper = "✋"
    case scissors = "✌️"
    
    var id: String { rawValue }
    
    func gameResult(against opponentSign: Sign) -> GameResult {
        if self == opponentSign { return .draw }
        
        switch (self, opponentSign) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            return .win
        default:
            return .lose
        }
    }
}
