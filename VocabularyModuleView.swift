import SwiftUI

struct VocabularyModuleView: View {
    let vocabularyWords = ["A for Apple", "B for Banana", "C for Car", "D for Dog", "E for Elephant", "F for Fish", "G for Guitar", "H for House", "I for Ice Cream", "J for Jacket", "K for Kangaroo", "L for Lemon", "M for Monkey", "N for Nest", "O for Orange", "P for Pineapple", "Q for Queen", "R for Rabbit", "S for Strawberry", "T for Tiger", "U for Umbrella", "V for Vanilla", "W for Watermelon", "X for Xylophone", "Y for Yak", "Z for Zebra"]
    
    var body: some View {
        List(vocabularyWords, id: \.self) { word in
            Text(word)
        }
        .navigationBarTitle("Alphabet and Vocabulary")
    }
}
