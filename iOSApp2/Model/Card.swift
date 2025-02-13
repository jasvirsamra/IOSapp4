//
//  Card.swift
//  iOSApp4
//
//  Created by Jasvir Singh on 2025-02-05.
//

import SwiftUI

struct Card: Identifiable {
  let id = UUID()
  var backgroundColor: Color = .yellow
  var elements: [CardElement] = []
} // Card
