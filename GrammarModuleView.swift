import SwiftUI

struct GrammarModuleView: View {
    var wordsWithMeaningsAndExamples: [(word: String, meaning: String, examples: [String])] = [
        // Add the grammar data here
    ]
    
    var body: some View {
        List(wordsWithMeaningsAndExamples, id: \.word) { wordData in
            VStack(alignment: .leading) {
                Text(wordData.word)
                    .font(.headline)
                Text("- \(wordData.meaning)")
                    .font(.subheadline)
                ForEach(wordData.examples, id: \.self) {example in
                    Text(example)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
            }
        }
        .navigationBarTitle("Grammar")
    }
}
