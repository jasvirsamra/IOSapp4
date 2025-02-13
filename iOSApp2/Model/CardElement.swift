//
//  CardElement.swift
//  iOSApp4
//
//  Created by Jasvir Singh on 2025-02-05.
//

import SwiftUI

protocol CardElement {
  var id: UUID { get }
} // CardElement

extension CardElement {
  func index(in array: [CardElement]) -> Int? {
    array.firstIndex { $0.id == id }
  }
} // CardElement extension

struct ImageElement: CardElement {
  let id = UUID()
  var image: Image
} // ImageElement
 
struct TextElement: CardElement {
  let id = UUID()
  var text = ""
  var textColor = Color.black
  var textFont = "Avenir Next"
} // TextElement
