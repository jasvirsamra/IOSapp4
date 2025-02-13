//
//  SingleCardView.swift
//  iOSApp2
//
//  Created by Chris Goerk on 2025-02-05.
//

import SwiftUI

struct SingleCardView: View {
  @Binding var card: Card
  @Environment(\.dismiss) var dismiss


  var body: some View {
    NavigationStack {
      CardDetailView(card: $card)
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button("Done") {
              dismiss()
            }
          }
        }
    } 
  } // body
} // SingleCardView

struct SingleCardView_Previews: PreviewProvider {
  struct SingleCardPreview: View {
    @EnvironmentObject var store: CardStore
    var body: some View {
      SingleCardView(card: $store.cards[0])
    }
  }
  static var previews: some View {
    SingleCardPreview()
      .environmentObject(CardStore(defaultData: true))
  }
} // SingleCardView_Previews
