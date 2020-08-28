//
//  ImageLoader.swift
//  PixabayPhotoViewer_SwiftUI
//
//  Created by home on 2020/08/08.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import SwiftUI
import Nuke

class ImageLoader: ObservableObject {
    @Published var image: UIImage
    
    private let url: URL
    
    init(url: URL, placeholder: UIImage = UIImage()) {
        self.image = placeholder
        self.url = url
        
        loadImage()
    }
    
    // URLから画像を読み込む
    private func loadImage() {
        ImagePipeline.shared.loadImage(with: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.image = response.image
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
