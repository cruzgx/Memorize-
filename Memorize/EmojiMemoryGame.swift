//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Cruz Gonzalez Garcia on 9/13/21.
//

//needs to import swiftUI since it talks to model and view (this is the viewmodel


// MARK: LEFT OF AT 51:05 of "cmp430 09 27 2021"
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    private static let emojis = ["🚕", "✈️", "🚜", "🚒", "🛳", "🏍", "🚀", "⛵️", "🛥", "🏎", "🚙", "🚉", "🚅", "🚠", "🚲", "🚤", "🚛", "🛺", "🚑", "🚘", "🚗", "🚃", "🚟", "🚝"]
    
    
    @Published private var model = EmojiMemoryGame.createMemoryGame()
    
    typealias Card = MemoryGame<String>.Card
    

    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOffPairsOfCards: 3) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    
    
    var cards: [Card] {
        return model.cards
    }
    
    // MARK: - Intents(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    

}
