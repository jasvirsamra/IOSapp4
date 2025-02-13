//
//  CardsListView.swift
//  iOSApp4
//
//  Created by Jasvir Singh on 2025-02-12.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    WelcomeView()
  }
} // Contentview

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(CardStore(defaultData: true))
  }
} // ContentView_Previews
