//
//  CardsListView.swift
//  iOSApp4
//
//  Created by Jasvir Singh on 2025-02-12.
//

import SwiftUI

struct CardsListView: View {
  @EnvironmentObject var store: CardStore
  @State private var selectedCard: Card?
  
  var body: some View {
    ZStack {
      Image("ListImage")
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()

      VStack {
        HeaderView()

        ScrollView(showsIndicators: false) {
          VStack {
            ForEach(store.cards) { card in
              CardThumbnail(card: card)
                .onTapGesture {
                  selectedCard = card
                }
            }
          }
          .padding(.top, 10)
        }
      }
      .ignoresSafeArea()
    }
    .fullScreenCover(item: $selectedCard) { card in
      if let index = store.index(for: card) {
        SingleCardView(card: $store.cards[index])
      } else {
        fatalError("Unable to locate selected card")
      }
    }
  } // body
} // CardsListView

struct CardsListView_Previews: PreviewProvider {
  static var previews: some View {
    CardsListView()
      .environmentObject(CardStore(defaultData: true))
  }
} // CardsListView_Previews
