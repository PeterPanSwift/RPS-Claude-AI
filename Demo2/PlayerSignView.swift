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