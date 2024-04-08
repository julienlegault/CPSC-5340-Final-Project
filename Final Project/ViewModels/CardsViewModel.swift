//
//  CardsViewModel.swift
//  Final Project
//
//  Created by Julien on 4/8/24.
//

import Foundation

class CardsViewModel : ObservableObject {
    
    @Published private(set) var cardsData = [CardModel]()
    @Published var hasError = false
    @Published var error : CardModelError?
    private let url = "https://api.magicthegathering.io/v1/cards"
    
    @MainActor
    func fetchData() async {
        if let url = URL(string: url) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                guard let results = try JSONDecoder().decode(CardResults?.self, from: data) else {
                    self.hasError.toggle()
                    self.error = CardModelError.decodeError
                    return
                }
                self.cardsData = results.cards
            } catch {
                self.hasError.toggle()
                self.error = CardModelError.customError(error: error)
            }
        }
    }
    
}

extension CardsViewModel {
    enum CardModelError : LocalizedError {
        case decodeError
        case customError(error: Error)
        
        var errorDescription: String? {
            switch self {
            case .decodeError:
                return "Decoding Error"
            case .customError(let error):
                return error.localizedDescription
            }
        }
    }
}
