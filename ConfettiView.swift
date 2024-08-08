import SwiftUI

struct ConfettiView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack {
            if isShowing {
                ForEach(0..<50, id: \.self) { index in
                    ConfettiPiece()
                }
            }
        }
    
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isShowing = false
                }
                }
            }
        }
}

struct ConfettiPiece: View {
    @State private var xOffset = Double.random(in: -100...100)
    @State private var yOffset = Double.random(in: -100...100)
    
    var body: some View {
        Image(systemName: "sparkles")
            .foregroundColor(.randomColor)
            .font(.title)
            .offset(x: xOffset, y: yOffset)
            .animation(.linear(duration: 2).repeatForever(), value: xOffset)
    }
}
