//
//  ImageFetcher.swift
//  PixabayPhotoViewer_SwiftUI
//
//  Created by home on 2020/07/28.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import Foundation

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
}
