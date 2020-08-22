//
//  ContentView.swift
//  Memorize
//
//  Created by Curtis Bridges on 8/18/20.
//  Copyright © 2020 Curtis Bridges. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewModel:  EmojiMemoryGame

    var body: AnyView {
        let view = HStack {
            ForEach(viewModel.cards) { card in
                CardView(card:  card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(.orange)
        if viewModel.cards.count > 8 {
            return AnyView(view.font(Font.largeTitle))
        } else {
            return AnyView(view)
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }.aspectRatio(CGFloat(0.66), contentMode: ContentMode.fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
