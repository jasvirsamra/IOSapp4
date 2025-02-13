//
//  CardsListView.swift
//  iOSApp4
//
//  Created by Jasvir Singh on 2025-02-12.
//

import SwiftUI

struct WelcomeView: View {
  @State private var isStarted = false

  var body: some View {
    VStack {
      if isStarted {
        CardsListView()
      } else {
        ZStack {
          Image("ListImage")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
          
          VStack {
            Image("ScavengerHunt")
              .resizable()
              .scaledToFit()
              .frame(width: 400, height: 200)
            
            ZStack {
              RoundedRectangle(cornerRadius: 10)
                .fill(Color.black)
                .opacity(0.5)
                .padding(.horizontal, 20)
              
              Text("""
                   Welcome to the Scavenger Hunt! 
                   You’ll receive 10 cards 
                   and 10 clues. Your task is to find 
                   each location, take a picture of
                   what we’re looking for, 
                   and submit your photos for 
                   a chance to win exciting prizes!
                   """)
                .padding()
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.title2)
                .multilineTextAlignment(.center)
            }
            .padding(.bottom, 20)

            Image("Hunter")
              .resizable()
              .scaledToFit()
              .frame(width: 150, height: 150)
              .padding(.bottom, 25)
          
            Button(action: {
              isStarted = true
            }) {
              Text("Get Started")
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding(.bottom, 50)
          }
        }
      }
    }
  } // body
} // WelcomeView

struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeView()
      .environmentObject(CardStore(defaultData: true))
  }
} // WelcomeView_Previews
