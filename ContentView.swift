import SwiftUI
import Network

struct ContentView: View {
    @State private var showLanguageOptions = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image("logo1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .ignoresSafeArea()
                
                Spacer()
                
                Text("Welcome to VerboVista")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.bottom)
                
                Spacer()
                
                NavigationLink(destination: ModulesListView()) {
                    Text("Start Learning English")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.bottom)
                }
                
                Spacer()
            }
            .background(Color.black)
            .navigationBarTitle("VerboVista ")
        }
    }
}

struct ModulesListView: View {
    var body: some View {
        List {
            NavigationLink(destination: VocabularyModuleView()) {
                Text("Alphabet and Vocabulary")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(20)
                    .padding()
            }
            
            NavigationLink(destination: GrammarModuleView()) {
                Text("Grammar")
                    .font(.headline)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(20)
                    .padding()
            }
            
            NavigationLink(destination: PracticeTestModuleView()) {
                Text("Practice Tests")
                    .font(.headline)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(20)
                    .padding()
            }
            
            NavigationLink(destination: WordOfTheDayModuleView()){
                Text("Word of the Day")
                    .font(.headline)
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(20)
                    .padding()
                
            }
            
            NavigationLink(destination: WordChallengeView()){
                Text("Word Challenge")
                    .font(.headline)
                    .padding()
                    .background(Color.brown)
                    .cornerRadius(20)
                    .padding()
                
            }
        }
        .navigationBarTitle("Modules")
        .navigationBarTitleDisplayMode(.inline)
        
        Image("logo1")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
            .frame(height: 60)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct VocabularyModuleView: View {
    let vocabularyWords = ["A for Apple", "B for Banana", "C for Car", "D for Dog", "E for Elephant", "F for Fish", "G for Guitar", "H for House", "I for Ice Cream", "J for Jacket", "K for Kangaroo", "L for Lemon", "M for Monkey", "N for Nest", "O for Orange", "P for Pineapple", "Q for Queen", "R for Rabbit", "S for Strawberry", "T for Tiger", "U for Umbrella", "V for Vanilla", "W for Watermelon", "X for Xylophone", "Y for Yak", "Z for Zebra"]
    
    var body: some View {
        List(vocabularyWords, id: \.self) { word in
            Text(word)
        }
        .navigationBarTitle("Alphabet and Vocabulary")
    }
}

struct GrammarModuleView: View {
    var wordsWithMeaningsAndExamples: [(word: String, meaning: String, examples: [String])] = [
        ("Adjective", "Describes a noun or pronoun", ["Tall", "Beautiful", "Quiet"]),
        ("Clause", "Group of words containing a subject and predicate", ["The man who won the race", "I like to swim in the ocean"]),
        ("Determiner", "Indicates specificity or quantity", ["Many", "Some", "All"]),
        ("Exclamation", "Expresses a strong emotion", ["Oh no!", "Wow!", "Hurray!"]),
        ("Fragment", "Incomplete sentence", ["I went to the store", "The cat sat on the mat"]),
        ("Gerund", "Verb form ending in -ing used as a noun", ["Swimming", "Singing", "Dancing"]),
        ("Homophone", "Words that sound the same but have different meanings", ["Cat", "Cute", "Caterpiller"]),
        ("Interjection", "Expresses emotion or exclamation", ["Oh no!", "Wow!", "Hurray!"]),
        ("Jargon", "Specialized vocabulary of a particular group or field", ["Buzzword", "Jargon", "Glossary"]),
        ("Keyword", "Word that is important or indicative", ["Search", "Engine", "Optimization"]),
        ("Linguistics", "Study of language and its structure", ["Syntax", "Semantics", "Phonetics"]),
        ("Modifier", "Word or phrase that gives more information", ["Very", "Quite", "Extremely"]),
        ("Noun", "Person, place, thing, or idea", ["John", "Paris", "Idea"]),
        ("Object", "Receives the action of the verb", ["Car", "Book", "Person"]),
        ("Predicate", "Includes the verb and all its modifiers", ["I like to swim", "The cat is sleeping", "The rain stopped"]),
        ("Quantifier", "Indicates quantity or amount", ["A lot", "Some", "None"]),
        ("Restrictive", "Limits the meaning of the noun", ["Only", "Particular", "Several"]),
        ("Subject", "Performer of the action in a sentence", ["I", "She", "They"]),
        ("Transitive", "Requires a direct object to complete its meaning", ["Give", "Love", "Help"]),
        ("Usage", "Correct or appropriate use of language", ["Use sparingly", "Use wisely", "Use consistently"]),
        ("Verb", "Action or state of being", ["Run", "Exist", "Eat"]),
        ("Word", "Basic unit of language", ["Cat", "Computer", "Apple"]),
        ("Syntax", "Arrangement of words and phrases to create sentences", ["I went to the store", "She said that she loves him", "They will come tomorrow"]),
        ("Yield", "Produce or provide", ["The harvest", "The result", "The income"]),
        ("Zest", "Enthusiasm or energy", ["Excited", "Energetic", "Passionate"])
    ]
    
    var body: some View {
        List(wordsWithMeaningsAndExamples, id: \.word) { wordData in
            VStack(alignment: .leading) {
                Text(wordData.word)
                    .font(.headline)
                Text("- \(wordData.meaning)")
                    .font(.subheadline)
                ForEach(wordData.examples, id: \.self) { example in
                    Text(example)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
            }
        }
        .navigationBarTitle("Grammar")
    }
}


import SwiftUI

struct PracticeTestModuleView: View {
    let alphabet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    let wordsByLetter = [
        "A": ["Apple"],
        "B": ["Banana"],
        "C": ["Car"],
        "D": ["Dog"],
        "E": ["Elephant"],
        "F": ["Fish"],
        "G": ["Guitar"],
        "H": ["House"],
        "I": ["Ice Cream"],
        "J": ["Jacket"],
        "K": ["Kangaroo"],
        "L": ["Lemon"],
        "M": ["Monkey"],
        "N": ["Nest"],
        "O": ["Orange"],
        "P": ["Pineapple"],
        "Q": ["Queen"],
        "R": ["Rabbit"],
        "S": ["Strawberry"],
        "T": ["Tiger"],
        "U": ["Umbrella"],
        "V": ["Vanilla"],
        "W": ["Watermelon"],
        "X": ["Xylophone"],
        "Y": ["Yak"],
        "Z": ["Zebra"],
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
        if let letterIndex = alphabet.indices.contains
