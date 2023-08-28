//
//  CatImagesView.swift
//  Tabby Cat
//
//  Created by Omar Alshehhi on 27/08/2023.
//

import SwiftUI
import Subsonic
struct CatImagesView: View {
    
    
    @State var catURL = "https://cataas.com/cat?"
    
    var body: some View {
        VStack{
            
            Spacer()
            AsyncImage(url: URL(string: catURL)!){ Image in
                Image
                    .resizable()
                    .scaledToFit()
                    .onAppear(){
                        play (sound:"meow.m4a")
                    }
                
            }placeholder: {
                ProgressView()
            }
            Spacer()
            
            Button ("New Cat Image"){
                catURL += "1"
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct CatImagesView_Previews: PreviewProvider {
    static var previews: some View {
        CatImagesView()
    }
}
