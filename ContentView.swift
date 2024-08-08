///
// ContentView.swift
// VerboVista
//
// Created by Shiven Patel on 3/16/24.
//
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
            
           .navigationBarTitle("Modules")
           .navigationBarTitleDisplayMode(.inline)
            
        }
       
        
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
        if let letterIndex = alphabet.indices.contains(currentLetterIndex) ? String(alphabet[currentLetterIndex]) : nil, let wordsForLetter = wordsByLetter[letterIndex], wordsForLetter.contains(userInput) {
            isCorrectAnswer = true
            correctCount += 1
            withAnimation {
                showConfetti = true
            }
        } else {
            isCorrectAnswer = false
        }
        
        questionCount += 1
        
        if questionCount < 10 {
            currentLetterIndex = Int.random(in: 0..<alphabet.count)
            userInput = ""
        } else {
            isCompleted = true
        }
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
            .offset(x: xOffset, y: yOffset)
            .animation(.interpolatingSpring(stiffness: 5, damping: 1))
            .onAppear {
                xOffset = Double.random(in: -100...100)
                yOffset = Double.random(in: -100...100)
            }
    }
}

extension Color {
    static var randomColor: Color {
        return Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
}

struct WordOfTheDayModuleView: View {
    private let wordsAndDefinitions: [String: String] = [
        "Pedagogue": "someone who educates young people",
        "Invective": "abusive language used to express blame or censure",
        "Checksum": "a digit representing the sum of the digits in an instance of digital data; used to check whether errors have occurred in transmission or storage",
        "Archipelago": "a group of many islands in a large body of water",
        "Obstinate": "marked by tenacious unwillingness to yield",
        "Mountebank": "a flamboyant deceiver",
        "Centrifugal": "tending to move away from the middle",
        "Eulogy": "a formal expression of praise for someone who has died",
        "Hauteur": "overbearing pride with a superior manner toward inferiors",
        "Pillory": "a wooden instrument of punishment on a post",
        "Artless": "simple and natural, without cunning or deceit",
        "Asphodel": "any of various chiefly Mediterranean plants having linear leaves and racemes of flowers",
        "Charisma": "personal attractiveness that enables you to influence others",
        "Rotund": "spherical in shape",
        "Annulment": "an official or legal cancellation",
        "Smattering": "a slight or superficial understanding of a subject",
        "Liaison": "a means of communication between groups",
        "Grenadine": "thin syrup made from pomegranate juice; used in mixed drinks",
        "Proscribe": "command against",
        "Jeopardize": "pose a threat to; present a danger to",
        "Risibility": "a disposition to laugh",
        "Incarcerate": "lock up or confine, in or as in a jail",
        "Concession": "the act of yielding",
        "Tangram": "a Chinese puzzle consisting of a square divided into seven pieces that must be arranged to match particular designs"
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

struct WordChallengeView: View {
    let wordChallenges: [(String, String, [String], Int)] = [
        ("Serendipity", "The occurrence and development of events by chance in a happy or beneficial way.", ["Luck", "Destiny", "Chance"], 1),
        ("Ephemeral", "Lasting for a very short time.", ["Temporary", "Eternal", "Enduring"], 0),
        ("Quixotic", "Exceedingly idealistic; unrealistic and impractical.", ["Practical", "Fantasy", "Realistic"], 1),
        ("Mellifluous", "Sweet or musical; pleasant to hear.", ["Harsh", "Melodious", "Noisy"], 1),
        ("Ethereal", "Extremely delicate and light in a way that seems not to be of this world.", ["Earthly", "Otherworldly", "Solid"], 1),
        ("Sonder", "The realization that each random passerby is living a life as vivid and complex as your own.", ["Solitude", "Connection", "Isolation"], 1),
        ("Petrichor", "The pleasant, earthy smell after rain.", ["Sunshine", "Rainbow", "Rain"], 2),
        ("Limerence", "The state of being infatuated with another person.", ["Enmity", "Infatuation", "Apathy"], 1),
        ("Nepenthe", "Something that can make you forget grief or suffering.", ["Remedy", "Agony", "Torment"], 0),
        ("Aurora", "The dawn, or the colorful polar lights.", ["Daybreak", "Twilight", "Sunset"], 0),
        ("Halcyon", "Denoting a period of time in the past that was idyllically happy and peaceful.", ["Chaotic", "Calm", "Turbulent"], 1),
        ("Eloquence", "Fluent or persuasive speaking or writing.", ["Mumbling", "Articulate", "Incoherent"], 1),
        ("Panacea", "A solution or remedy for all difficulties or diseases.", ["Bane", "Cure-all", "Affliction"], 1),
        ("Sanguine", "Optimistic or positive, especially in an apparently bad or difficult situation.", ["Pessimistic", "Cheerful", "Hopeless"], 1),
        ("Effervescent", "Vivacious and enthusiastic.", ["Boring", "Animated", "Lively"], 2),
        ("Ebullient", "Cheerful and full of energy.", ["Melancholic", "Vivacious", "Gloomy"], 1),
        ("Surreptitious", "Kept secret, especially because it would not be approved of.", ["Open", "Covert", "Transparent"], 1),
        ("Ephemeral", "Lasting for a very short time.", ["Permanent", "Transient", "Enduring"], 1),
        ("Luminous", "Full of or shedding light; bright or shining, especially in the dark.", ["Dark", "Radiant", "Glowing"], 1)
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



