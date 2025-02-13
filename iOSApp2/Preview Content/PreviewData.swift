//
//  PreviewData.swift
//  iOSApp4
//
//  Created by Jasvir Singh on 2025-02-05.
//

import SwiftUI

let initialCards: [Card] = [
  Card(backgroundColor: .black, elements: initialElements),
  
  Card(backgroundColor: .black, elements: [
    ImageElement(image: Image("OlympicTorch")),
    TextElement(text: "A flame that never dies, a symbol of unity and pride. Carried across nations, it ignites the games with tradition and might!", textColor: .black)
  ]),
  
  Card(backgroundColor: .black, elements: [
    ImageElement(image: Image("OlympicRings")),
    TextElement(text: "Five rings, five colors, linked as one. A symbol of continents and competition, where dreams are won!", textColor: .black)
  ]),
  
  Card(backgroundColor: .black, elements: [
    ImageElement(image: Image("GoldMedal")),
    TextElement(text: "Around the neck of the fastest and strongest, a golden prize for those who strive the longest. Victory, glory, and hard work combined—this is the reward for the determined mind!", textColor: .black)
  ]),
  
  Card(backgroundColor: .black, elements: [
    ImageElement(image: Image("Stadium")),
    TextElement(text: "A place where nations meet and cheer, where history is made year after year. The crowd erupts, the records break—this is where champions awake!", textColor: .black)
  ]),
  
  Card(backgroundColor: .black, elements: [
    ImageElement(image: Image("Marathon")),
    TextElement(text: "From the starting line to the very last mile, a test of endurance, spirit, and style. 26.2, a number so grand—cross the finish, and raise your hand!", textColor: .black)
  ]),
  
  Card(backgroundColor: .black, elements: [
    ImageElement(image: Image("Gymnastics")),
    TextElement(text: "With balance and grace, they flip and they spin, defying gravity to take the win. Strength and agility, all combined—watch the artistry, perfectly timed!", textColor: .black)
  ]),
  
  Card(backgroundColor: .black, elements: [
    ImageElement(image: Image("SwimmingPool")),
    TextElement(text: "A race in the water, a battle so quick, slicing through waves with each powerful kick. The wall is near, the clock is tight—who will touch first and claim the night?", textColor: .black)
  ]),
  
  Card(backgroundColor: .black, elements: [
    ImageElement(image: Image("Weightlifting")),
    TextElement(text: "Lift it high, lift it strong, hold it steady, don’t take long! Strength and power, heart and soul—this is the game where lifters go bold!", textColor: .black)
  ]),
  
  Card(backgroundColor: .black, elements: [
    ImageElement(image: Image("Basketball")),
    TextElement(text: "Dribble, pass, take the shot, the crowd erupts—it's getting hot! A game of skill, a game of speed, only the best take the lead!", textColor: .black)
  ]),
]

let initialElements: [CardElement] = [
  ImageElement(image: Image("OlympicStadium")),
  TextElement(text: "The grand opening, a dazzling sight! Flags wave high in the stadium's light. Athletes march, nations unite—this is the start of a glorious fight!", textColor: .black)
]

