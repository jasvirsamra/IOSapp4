//
//  CardsListView.swift
//  iOSApp4
//
//  Created by Jasvir Singh on 2025-02-12.
//

import SwiftUI

struct HeaderView: View {
  var body: some View {
    VStack {
      Image("ScavengerHunt")
        .resizable()
        .scaledToFit()
        .frame(width: UIScreen.main.bounds.width, height: 100)
        .padding(.top, 50)
      
      Text("""
           Here are your Cards.
           Happy Hunting!
           """)
        .font(.title2)
        .fontWeight(.bold)
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .padding(.bottom, 20)
    }
    .background(Color.black.opacity(0.5))
    .ignoresSafeArea(edges: .horizontal)
  }
} // HeaderView

#Preview {
  HeaderView()
} // HeaderView_Previews
