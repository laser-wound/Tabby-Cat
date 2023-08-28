//
//  CatFactsManger.swift
//  Tabby Cat
//
//  Created by Omar Alshehhi on 27/08/2023.
//

import Foundation

class CatFactsManger: ObservableObject {
    
    let apiURL = URL(string: "https://catfact.ninja/fact")!
    @Published var catFact: CatFact?
    
    func getCatFact() {
        catFact = nil
        Task{
            let (data, _) = try await URLSession.shared.data(from: apiURL )
         print("we got the data!")
          print(String(data: data, encoding: .utf8)!)
            
            try await MainActor.run {
                self.catFact = try JSONDecoder().decode(CatFact.self, from: data)
            }
        }
    }
}
