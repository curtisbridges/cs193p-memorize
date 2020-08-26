//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Curtis Bridges on 8/20/20.
//  Copyright © 2020 Curtis Bridges. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>?
    @Published var theme: EmojiTheme?

    func createMemoryGame(for gameTheme: EmojiGameThemes) {
        let emojis = themeContents(for: gameTheme)
        let count = themeCount(for: gameTheme) ?? Int.random(in: 2...emojis.count)
        let color = themeColor(for: gameTheme)

        theme = EmojiTheme(name: themeName(for: gameTheme), emojis: emojis, num: count, color: color)

        model = MemoryGame<String>(numberOfPairsOfCards: count) { pairIndex in
            return emojis[pairIndex]
        }
    }

    //MARK: - Access to the model

    var cards: Array<MemoryGame<String>.Card>? {
        return model?.cards
    }

    //MARK: - Intent(s)

    func choose(card: MemoryGame<String>.Card) {
        model?.choose(card: card)
    }

    //MARK: - Themes

    enum EmojiGameThemes {
        case birthday
        case valentines
        case summer
        case halloween
        case thanksgiving
        case christmas
    }

    private func themeName(for theme: EmojiGameThemes) -> String {
        switch theme {
        case .birthday:
            return "Birthday"
        case .valentines:
            return "Valentines"
        case .summer:
            return "Summer"
        case .halloween:
            return "Halloween"
        case .thanksgiving:
            return "Thanksgiving"
        case .christmas:
            return "Christmas"
        }
    }

    private func themeContents(for theme: EmojiGameThemes) -> [String] {
        switch theme {
        case .birthday:
            return ["🎂", "🎁", "🥳", "🎉", "🍻"]
        case .valentines:
            return ["❤️", "🥰", "🌹", "🍫", "💋", "🍷"]
        case .summer:
            return ["☀️", "🏖", "🍔", "🌭", "🎡", "⚾️", "💥"]
        case .halloween:
            return ["👻", "🎃", "🕷", "👺", "💀"]
        case .thanksgiving:
            return ["🦃", "🌽", "🍁", "🏈", "🍗", "🥔", "🍽"]
        case .christmas:
            return ["🎅🏻", "⛄️", "🎁", "🍬", "🐭", "🛷", "⛸"]
        }
    }

    private func themeCount(for theme: EmojiGameThemes) -> Int? {
        switch theme {
        case .summer: return 4
        default: return nil
        }
    }

    private func themeColor(for theme: EmojiGameThemes) -> Color {
        switch theme {
        case .summer: return Color.green
        case .birthday: return Color.blue
        case .halloween: return Color.orange
        case .thanksgiving: return Color.yellow
        case .christmas: return Color.red
        case .valentines: return Color.red
        }
    }

    func themeSummary(for theme: EmojiGameThemes) -> String {
        return "TODO"
    }
}
