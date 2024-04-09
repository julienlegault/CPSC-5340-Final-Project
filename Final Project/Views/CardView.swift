//
//  CardView.swift
//  Final Project
//
//  Created by Julien on 4/9/24.
//

import SwiftUI

struct CardView: View {
    
    let card : CardModel
    
    var body: some View {
        VStack {
            NameBoxView(card: card)
            Text(card.type)
                .font(.system(size: 15))
                .padding()
            Text(card.text)
            if card.power != nil && card.toughness != nil {
                CreaturePTView(power: card.power!, toughness: card.toughness!)
            }
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(.black, lineWidth: 5)
        }
    }
}
