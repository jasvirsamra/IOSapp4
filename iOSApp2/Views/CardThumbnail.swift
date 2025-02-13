//
//  CardsListView.swift
//  iOSApp4
//
//  Created by Jasvir Singh on 2025-02-12.
//

import SwiftUI

struct CardThumbnail: View {
  let card: Card

  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 15)
        .foregroundColor(card.backgroundColor)
        .frame(width: Settings.thumbnailSize.width, height: Settings.thumbnailSize.height)

      // Check for imageElement and display it
      if let imageElement = card.elements.first(where: { $0 is ImageElement }) as? ImageElement {
        imageElement.image
          .resizable()
          .scaledToFill()
          .frame(width: Settings.thumbnailSize.width, height: Settings.thumbnailSize.height)
          .clipShape(RoundedRectangle(cornerRadius: 15))
      }
    }
    .frame(width: Settings.thumbnailSize.width, height: Settings.thumbnailSize.height)
  } // body
} // CardThumbnail

struct CardThumbnail_Previews: PreviewProvider {
  static var previews: some View {
    CardThumbnail(card: initialCards[0])
  }
} // CardThumbnail_Previews
