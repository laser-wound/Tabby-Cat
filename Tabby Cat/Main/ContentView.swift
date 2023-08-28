//
//  ContentView.swift
//  Tabby Cat
//
//  Created by Omar Alshehhi on 27/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            CatFactsView()
                .tabItem{
                    Label("Cat Facts", systemImage: "lightbulb")
                }
            CatImagesView()
                .tabItem{
                    Label("Random cat", systemImage: "photo")
                }
            CatBounceView()
                .edgesIgnoringSafeArea(.top)
                .tabItem{
                    Label("Bounce Cat", systemImage: "arrowshape.bounce.right")
                }
            CatGalleryView()
                .tabItem{
                    Label("Cat Gallery", systemImage: "photo.stack")
                }
            CatDetectionView()
                .tabItem {
                    Image(systemName: "viewfinder")
                    Text("CatML")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
