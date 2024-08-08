import SwiftUI

struct WordChallengeView: View {
    let wordChallenges: [(String, String, [String], Int)] = [
        // Add the word challenges here
    ]
    
    @State private var currentChallengeIndex = 0
    @State private var userAnswer: Int?
    
    var body: some View {
            VStack {
                Text("\(wordChallenges[currentChallengeIndex].0)")
                    .font(.title)
                    .padding()
                
                ForEach(0..<wordChallenges[currentChallengeIndex].2.count, id: \.self) { index in
                    Button(action: {
                        userAnswer = index
                    }) {
                        Text(wordChallenges[currentChallengeIndex].2[index])
                            .padding()
                            .background(userAnswer == index ? (userAnswer == wordChallenges[currentChallengeIndex].3 ? Color.green : Color.red) : Color.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
                
                if let selectedAnswer = userAnswer {
                    Text("Definition: \(wordChallenges[currentChallengeIndex].1)")
                        .padding()
                }
                
                Button("Next Question") {
                    currentChallengeIndex = (currentChallengeIndex + 1) % wordChallenges.count
                    userAnswer = nil
                }
                .padding()
            }
            .navigationBarTitle("Word Challenge")
        }
}
