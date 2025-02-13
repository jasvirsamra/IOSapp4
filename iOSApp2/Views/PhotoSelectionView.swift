//
//  PhotoSelectionView.swift
//  iOSApp2
//
//  Created by Chris Goerk on 2025-02-12.
//

import SwiftUI
import PhotosUI

struct PhotoSelectionView: View {
  @Binding var card: Card
  @State private var selectedItem: PhotosPickerItem? = nil
  @State private var selectedImage: UIImage? = nil
  @State private var showCamera = false
  @EnvironmentObject var store: CardStore
  @Environment(\.dismiss) private var dismiss
  
  var imageFileName: String {
    return "card\(card.id).jpg"
  }
  
  var body: some View {
    NavigationStack {
      ZStack {
        Image("ListImage")
          .resizable()
          .scaledToFill()
          .ignoresSafeArea()
        
        VStack {
          if let image = selectedImage {
            Image(uiImage: image)
              .resizable()
              .scaledToFit()
              .frame(width: 350, height: 300)
              .clipShape(RoundedRectangle(cornerRadius: 30))
            
            Button("Remove Photo") {
              selectedImage = nil
              selectedItem = nil
              deleteImageFromStorage()
            }
            .frame(width: 200, height: 50)
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(10)
            
          } else {
            Text("No Image Selected")
              .font(.title)
              .foregroundColor(.white)
          }
          
          VStack(spacing: 10) {
            PhotosPicker("Select from Gallery", selection: $selectedItem, matching: .images)
              .frame(width: 200, height: 50)
              .foregroundColor(.white)
              .background(Color.black)
              .cornerRadius(10)
            
            Button("Take a Photo") {
              showCamera = true
            }
            .frame(width: 200, height: 50)
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(10)
            .disabled(!CameraView.supportsCamera)
          }
          .padding()
        }
      }
      .onChange(of: selectedItem) { _, newItem in
        Task {
          if let newItem {
            if let data = try? await newItem.loadTransferable(type: Data.self),
               let image = UIImage(data: data) {
              selectedImage = image
              saveImageToStorage(image)
            }
          }
        }
      }
      .sheet(isPresented: $showCamera) {
        CameraView(image: $selectedImage, onImageCaptured: saveImageToStorage)
      }
      .onAppear {
        loadImageFromStorage()
      }
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button("Done") {
            dismiss()
          }
          .foregroundColor(.white)
          .fontWeight(.bold)
        }
      }
    } // NavigationStack
  } // body
  
  /// **Save Image to Local Storage**
  func saveImageToStorage(_ image: UIImage) {
    if let data = image.jpegData(compressionQuality: 0.8) {
      let url = getDocumentsDirectory().appendingPathComponent(imageFileName)
      try? data.write(to: url)
      card.imagePath = url.path
      store.saveCards() // Save changes
    }
  } // saveImageToStorage
  
  /// **Load Image from Local Storage**
  func loadImageFromStorage() {
    let url = getDocumentsDirectory().appendingPathComponent(imageFileName)
    if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
      selectedImage = image
    }
  } // loadImageFromStorage()
  
  /// **Delete Image from Local Storage**
  func deleteImageFromStorage() {
    let url = getDocumentsDirectory().appendingPathComponent(imageFileName)
    try? FileManager.default.removeItem(at: url)
  } // deleteImageFromStorage()
  
  /// **Get App's Documents Directory**
  func getDocumentsDirectory() -> URL {
    FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
  } // getDocumentsDirectory()
} // PhotoSelectionView

#Preview {
  PhotoSelectionView(card: .constant(Card(id: UUID())))
    .environmentObject(CardStore())
} // PhotoSelectionView_Previews
