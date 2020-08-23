//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Curtis Bridges on 8/20/20.
//  Copyright © 2020 Curtis Bridges. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()

    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷", "👺", "💀"]
        let randomNum = Int.random(in: 2...5)

        return MemoryGame<String>(numberOfPairsOfCards: randomNum) { pairIndex in
            return emojis[pairIndex]
        }
    }

    //MARK: - Access to the model

    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }

    //MARK: - Intent(s)

    func choose(card: MemoryGame<String>.Card) {
        print("Chosen card = \(card)")
        model.choose(card: card)
    }
}
