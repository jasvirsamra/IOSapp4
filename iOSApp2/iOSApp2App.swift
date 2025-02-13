///
//  CardsListView.swift
//  iOSApp4
//
//  Created by Jasvir Singh on 2025-02-12.
//

import SwiftUI

@main
struct iOSApp2App: App {
  @StateObject var store = CardStore(defaultData: true)

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(store)
    }
  }
}
