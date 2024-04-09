//
//  CardRulingsView.swift
//  Final Project
//
//  Created by Julien on 4/8/24.
//

import SwiftUI

struct CardRulingsView: View {
    
    let rulings : [RulingsModel]
    
    var body: some View {
        ForEach(rulings) { ruling in
            VStack {
                Text(ruling.date)
                Text(ruling.text)
                    .padding()
            }
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.black, lineWidth: 2)
            }
        }
    }
}
