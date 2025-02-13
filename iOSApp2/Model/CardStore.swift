//
//  CardStore.swift
//  iOSApp4
//
//  Created by Jasvir Singh on 2025-02-05.
//

import SwiftUI

class CardStore: ObservableObject {
  @Published var cards: [Card] = []

  init(defaultData: Bool = false) {
    if defaultData {
      cards = initialCards
    }
  }

  func index(for card: Card) -> Int? {
    cards.firstIndex { $0.id == card.id }
  }
} // CardStore
