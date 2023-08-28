//
//  CatDetectionView.swift
//  Tabby Cat
//
//  Created by Omar Alshehhi on 28/08/2023.
//

import SwiftUI
import PhotosUI

struct CatDetectionView: View {
    @State private var image: Image?
    @State private var photoPicked: PhotosPickerItem?
    @StateObject private var catDetectionManager = CatDetectionManger()

    var body: some View {
        VStack {

         if let image {
         image
         .resizable()
         .scaledToFit()
         .frame(maxHeight: 300)
         .overlay {
         VStack {
         Spacer()
        switch catDetectionManager.catDetectionResult {
         case .isCat:
         Text("Is Cat!")
         .padding()
         .background(.green)
         case .notCat:
         Text("Not Cat!")
         .padding()
         .background(.red)
         case .error:
         Text("Error")
         .padding()
         .background(.gray)
         case .processing:
         ProgressView().progressViewStyle(.linear)
         }
         }
         }
         }
         PhotosPicker(selection: $photoPicked) {
         Label("Pick a photo", systemImage: "photo")
         }
         .buttonStyle(.borderedProminent)
         .onChange(of: photoPicked) { newValue in
         Task {
         if let data = try? await photoPicked?.loadTransferable(type: Data.self),
         let uiImage = UIImage(data: data)
         {
         catDetectionManager.detect(with: uiImage)
         image = Image(uiImage: uiImage)
         }
         }
         }

         }
         }
        }

struct CatDetectionView_Previews: PreviewProvider {
    static var previews: some View {
        CatDetectionView()
    }
}
