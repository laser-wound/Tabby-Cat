//
//  CatFactsView.swift
//  Tabby Cat
//
//  Created by Omar Alshehhi on 27/08/2023.
//

import SwiftUI

struct CatFactsView: View {
    
    @StateObject var catFactsManger = CatFactsManger()
    
    
    var body: some View {

        VStack{
            if let catFact = catFactsManger.catFact {
                Text(catFact.fact)
                    .padding()
            }else {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
        
        .onAppear{
                catFactsManger.getCatFact()
            }
    }
}

struct CatFactsView_Previews: PreviewProvider {
    static var previews: some View {
        CatFactsView()
    }
}
