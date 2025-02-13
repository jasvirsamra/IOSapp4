//
//  CardElementView.swift
//  iOSApp2
//
//  Created by Chris Goerk on 2025-02-05.
//

import SwiftUI

struct CardElementView: View {
  let element: CardElement

  var body: some View {
    if let element = element as? ImageElement {
      ImageElementView(element: element)
    } else if let element = element as? SelectedImageElement {
      SelectedImageElementView(element: element)
    } else if let element = element as? TextElement {
      TextElementView(element: element)
    }
  }
} // CardElementView

struct ImageElementView: View {
  let element: ImageElement

  var body: some View {
    element.image
      .resizable()
      .frame(maxWidth: .infinity)
  }
} // ImageElementView

struct SelectedImageElementView: View {
  let element: SelectedImageElement

  var body: some View {
    Image(element.imagePath)
        .resizable()
        .scaledToFill()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
  } // SelectedImageElementView

struct TextElementView: View {
  let element: TextElement

  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 10)
        .fill(Color.white)
        .shadow(radius: 5)
      Text(element.text)
        .font(.custom(element.textFont, size: 22))
        .foregroundColor(element.textColor)
        .multilineTextAlignment(.center)
        .padding(8)
    }
    .padding([.leading, .trailing], 10)
    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
    .fixedSize(horizontal: false, vertical: true)
  }
} // TextElementView



