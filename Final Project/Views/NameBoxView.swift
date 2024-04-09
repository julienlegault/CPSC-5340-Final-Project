//
//  NameBoxView.swift
//  Final Project
//
//  Created by Julien on 4/9/24.
//

import SwiftUI

struct NameBoxView: View {
    
    let card : CardModel
    
    var body: some View {
        HStack {
            Text(card.name)
                .font(.system(size: 25))
            Spacer()
            Text(card.manaCost)
                .font(.system(size: 25))
        }
    }
}
