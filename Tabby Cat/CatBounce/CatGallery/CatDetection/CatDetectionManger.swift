//
//  CatDetectionManger.swift
//  Tabby Cat
//
//  Created by Omar Alshehhi on 28/08/2023.
//

import Foundation
import Vision
import UIKit

enum CatDetectionState {
    case error, processing, isCat, notCat
}


class CatDetectionManger: ObservableObject {
    @Published var catDetectionResult = CatDetectionState.processing
    private let model: VNCoreMLModel
    
    init() {
        do {
            let modelConfig = MLModelConfiguration()
            let coreMLModel = try MobileNetV2(configuration: modelConfig)
            model = try VNCoreMLModel(for: coreMLModel.model)
        }catch {
            fatalError("Could not initialize the CoreML model: \(error)")
        }
    }
    
    func detect(with image: UIImage){
        guard let cgImage = image.cgImage else {
            catDetectionResult = .error
            return
        }
        let handler = VNImageRequestHandler(cgImage: cgImage)
        
        Task{
            try handler.perform([request])
        }
    }
    
    // The actual request, set up as a lazy var
     lazy var request: VNCoreMLRequest = {
     let request = VNCoreMLRequest(model: model) { request, error in
     guard let results = request.results as? [VNClassificationObservation],
     let topResult = results.first else {
     self.catDetectionResult = .error
     return
     }

     Task {
     await MainActor.run {
     print(topResult)
    self.catDetectionResult =
    topResult.identifier.lowercased().contains("cat") ? .isCat : .notCat
     }
     }
     }
     return request
     }()
    }

