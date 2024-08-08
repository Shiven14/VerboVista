import SwiftUI

struct WordOfTheDayModuleView: View {
    private let wordsAndDefinitions: [String: String] = [
        // Add the words and definitions here
    ]
    
    @State private var remainingWords: [String]
    @State private var wordOfTheDay: (String, String)?
    
    init() {
        _remainingWords = State(initialValue: Array(wordsAndDefinitions.keys.shuffled()))
    }
    
    var body: some View {
        VStack {
            if let wordData = wordOfTheDay {
                Text(wordData.0)
                    .font(.largeTitle)
                    .padding()
                
                Text(wordData.1)
                    .padding()
            } else {
                Text("No more words to display.")
            }
        }
        .onAppear {
            if !remainingWords.isEmpty {
                wordOfTheDay = (remainingWords.removeFirst(), wordsAndDefinitions[remainingWords[0]]!)
            } else {
                wordOfTheDay = nil
            }
        }
        .navigationBarTitle("Word of the Day")
    }
}
