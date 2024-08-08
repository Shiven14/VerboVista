import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    var isCorrectAnswer: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(isCorrectAnswer ? Color.green : Color.red)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}
