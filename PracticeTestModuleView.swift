import SwiftUI

struct PracticeTestModuleView: View {
    let alphabet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    let wordsByLetter = [
        // Add the words data here
    ]
    
    @State private var userInput = ""
    @State private var currentLetterIndex = 0
    @State private var isCorrectAnswer = false
    @State private var isCompleted = false
    @State private var correctCount = 0
    @State private var questionCount = 0
    @State private var showConfetti = false
    
    var currentLetter: String {
        String(alphabet[currentLetterIndex])
    }
    
    var body: some View {
        VStack {
            Text("Enter a word starting with the letter \(currentLetter)")
                .font(.headline)
                .padding()
            
            TextField("Enter your word", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Submit") {
                checkAnswer()
            }
            .buttonStyle(CustomButtonStyle(isCorrectAnswer: isCorrectAnswer))
            
            if isCompleted {
                showCompletionMessage()
            }
        }
        .navigationBarTitle("Practice Test")
        .background(isCorrectAnswer ? Color.green : Color.red)
        .overlay(
            ConfettiView(isShowing: $showConfetti)
        )
    }
    
    private func checkAnswer() {
        // Add checkAnswer logic here
    }
    
    private func showCompletionMessage() -> some View {
        let percentage = Double(correctCount) / Double(questionCount) * 100
        return Group {
            Text("Congratulations! You completed the practice test.")
                .font(.title)
                .padding()
            Text("You got \(correctCount) out of \(questionCount) correct (\(percentage, specifier: "%.0f")%)")
                .padding()
        }
    }
    
    struct CustomButtonStyle: ButtonStyle {
        let isCorrectAnswer: Bool
        
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(isCorrectAnswer ? Color.green : Color.red)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}
