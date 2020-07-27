//
//  Parsing.swift
//  PixabayPhotoViewer_SwiftUI
//
//  Created by home on 2020/07/27.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import Foundation
import Combine

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, ImageError> {
    let decoder = JSONDecoder()
    
    return Just(data)
        .decode(type: T.self, decoder: decoder)
        .mapError { error in
            .parsing(description: error.localizedDescription)
    }
    .eraseToAnyPublisher()
}
