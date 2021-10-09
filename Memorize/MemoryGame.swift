//
//  MemoryGame.swift
//  Memorize
//
//  Created by Cruz Gonzalez Garcia on 9/13/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUp: Int?

        get {
                cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnlyElementIndex
        }


        set {
                cards.indices.forEach{ cards[$0].isFaceUp = ($0 == newValue) }
            }
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
           
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].contnent {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indicies {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
//
//    func indexof(of card: Card) -> Int? {
//        for index in 0..<cards.count {
//            if cards[index].id == card.id {
//                return index
//            }
//        }
//        return nil; //this needs to be fixed.
//    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairOfCards * 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let myContent = createCardContent(pairIndex)
            cards.append(Card(content: myContent, id: pairIndex * 2))
            cards.append(Card(content: myContent, id: pairIndex * 2 + 1))
        }
    }
    
    
    struct Card: Identifiable {
        
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}


extension Array {
    var oneAndOnlyElementIndex: Element? {
        if self.count == 1 {
            return self.first
        } else {
            return nil
        }
    }
}
