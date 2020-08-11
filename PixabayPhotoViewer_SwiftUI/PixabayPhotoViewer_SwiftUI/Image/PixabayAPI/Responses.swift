//
//  Responses.swift
//  PixabayPhotoViewer_SwiftUI
//
//  Created by home on 2020/07/27.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import Foundation

struct ImageListResponse: Codable {
    var hits: [Hits]
    struct Hits: Codable {
        var id: Int
        var tags: String
        var user: String
        var previewURL: String
    }
}

struct ImageDetailResponse: Codable {
    var hits: [Hits]
    struct Hits: Codable {
        var id: Int
        var tags: String
        var views: Int
        var favorites: Int
        var likes: Int
        var user: String
        var webformatURL: String
    }
}
