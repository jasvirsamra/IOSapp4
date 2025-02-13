//
//  CardDetailView.swift
//  iOSApp2
//
//  Created by Chris Goerk on 2025-02-05.
//

import SwiftUI

struct CardDetailView: View {
  @EnvironmentObject var store: CardStore
  @Binding var card: Card
  @State private var showPhotoSelection = false

  var body: some View {
    VStack {
      ZStack {
        card.backgroundColor
        
        // display all elements in the card
        ForEach($card.elements, id: \.id) { $element in
          CardElementView(element: element)
        }
        
        VStack {
          Spacer()
          
          // Display selected image
          if let image = card.selectedImage {
            Image(uiImage: image)
              .resizable()
              .scaledToFill()
              .frame(width: 150, height: 200)
              .cornerRadius(15)
              .clipped()
              .padding()
          }
        }
      }
      Button("Select or Take a Photo") {
        showPhotoSelection = true
      }
      .padding()
      .foregroundColor(.white)
      .background(Color.black)
      .cornerRadius(8)
      .padding()
    }
    .sheet(isPresented: $showPhotoSelection) {
      PhotoSelectionView(card: $card)
        .environmentObject(store)
    }
  } // body
} // CardDetailView

struct CardDetailView_Previews: PreviewProvider {
  struct CardDetailPreview: View {
    @EnvironmentObject var store: CardStore
    var body: some View {
      CardDetailView(card: $store.cards[0])
    }
  }

  static var previews: some View {
    CardDetailPreview()
      .environmentObject(CardStore(defaultData: true))
  }
} // CardDetailView_Previews
