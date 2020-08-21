//
//  MemoryGame.swift
//  Memorize
//
//  Created by Curtis Bridges on 8/20/20.
//  Copyright © 2020 Curtis Bridges. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    // cards
    var cards: Array<Card>

    func choose(card: Card) {
        print("Card chosen... \(card)")
    }

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }

    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isChosen: Bool = false
        var content: CardContent
        var id: Int
    }
}
