//
//  CatBounceView.swift
//  Tabby Cat
//
//  Created by Omar Alshehhi on 27/08/2023.
//

import SwiftUI
import MapKit

struct CatBounceView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> CatBounceViewController {
        let storyboard = UIStoryboard(name: "CatBounceScreen", bundle: .main)
        
        if let viewController = storyboard.instantiateViewController(withIdentifier: "CatBounce") as? CatBounceViewController {
            return viewController
        }else{
            fatalError("Could not instantiate")
        }
    }
    
    func updateUIViewController(_ uiViewController: CatBounceViewController, context: Context) {
        //empty
    }
}


struct CatBounceView_Previews: PreviewProvider {
    static var previews: some View {
        CatBounceView()
    }
}
