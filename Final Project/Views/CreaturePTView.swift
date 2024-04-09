//
//  CreaturePTView.swift
//  Final Project
//
//  Created by Julien on 4/9/24.
//

import SwiftUI

struct CreaturePTView: View {
    
    let power : String
    let toughness : String
    
    var body: some View {
        HStack {
            Spacer()
            Text("\(power)/\(toughness)")
                .font(.system(size: 25))
        }
    }
}

#Preview {
    CreaturePTView(power : "3", toughness: "4")
}
