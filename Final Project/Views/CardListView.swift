//
//  CardListView.swift
//  Final Project
//
//  Created by Julien on 4/8/24.
//

import SwiftUI

struct CardListView: View {
    @EnvironmentObject var loginView : LoginViewModel
    @ObservedObject var cardsvm = CardsViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(cardsvm.cardsData) { card in
                    NavigationLink {
                        CardDetail(card: card)
                    } label: {
                        Text(card.name)
                    }
                }
            }
            .task {
                await cardsvm.fetchData()
            }
            .listStyle(.grouped)
            .navigationTitle("Magic Cards")
            .toolbar {
                Button {
                    loginView.signOut()
                } label: {
                    Text("Sign Out")
                }
            }
            .alert(isPresented: $cardsvm.hasError, error: cardsvm.error) {
                Text("")
            }
        }
    }
}

#Preview {
    CardListView()
}
