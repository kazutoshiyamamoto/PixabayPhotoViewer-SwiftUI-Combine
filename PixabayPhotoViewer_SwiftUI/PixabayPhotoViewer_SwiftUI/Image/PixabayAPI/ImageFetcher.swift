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

extension ImageFetcher: ImageFetchable {
    func fetchImage(searchTerm: String) -> AnyPublisher<ImageResponse, ImageError> {
        return image(components: makeImageComponents(searchTerm: searchTerm))
    }
    
    private func image<T>(components: URLComponents) -> AnyPublisher<T, ImageError> where T: Decodable {
        guard let url = components.url else {
            let error = ImageError.network(description: "Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in
                .network(description: error.localizedDescription)
        }
        .flatMap(maxPublishers: .max(1)) { pair in
            decode(pair.data)
        }
        .eraseToAnyPublisher()
    }
}
