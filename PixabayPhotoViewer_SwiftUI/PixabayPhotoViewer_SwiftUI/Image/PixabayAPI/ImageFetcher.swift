//
//  ImageFetcher.swift
//  PixabayPhotoViewer_SwiftUI
//
//  Created by home on 2020/07/28.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import Foundation
import Combine

protocol ImageFetchable {
    func fetchImage(searchTerm: String) -> AnyPublisher<ImageResponse, ImageError>
}

class ImageFetcher {
    private let session: URLSession
    init(session: URLSession = .shared) {
        self.session = session
    }
}

private extension ImageFetcher {
    struct PixabayAPI {
        static let scheme = "https"
        static let host = "pixabay.com"
        static let path = "/api/"
        static let key = ""
    }
    
    func makeImageComponents(searchTerm: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = PixabayAPI.scheme
        components.host = PixabayAPI.host
        components.path = PixabayAPI.path
        
        components.queryItems = [
            URLQueryItem(name: "q", value: searchTerm),
            URLQueryItem(name: "key", value: PixabayAPI.key)
        ]
        
        return components
    }
}
