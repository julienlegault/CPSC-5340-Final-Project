//
//  CardDetail.swift
//  Final Project
//
//  Created by Julien on 4/8/24.
//

import SwiftUI

struct CardDetail: View {
    
    let card : CardModel
    
    var body: some View {
        List {
            VStack {
                CardView(card: card)
                if card.rulings != nil {
                    Text("Rulings")
                        .padding(.top)
                        .font(.system(size: 20))
                    CardRulingsView(rulings: card.rulings!)
                }
            }
        }
        .padding()
    }
}
