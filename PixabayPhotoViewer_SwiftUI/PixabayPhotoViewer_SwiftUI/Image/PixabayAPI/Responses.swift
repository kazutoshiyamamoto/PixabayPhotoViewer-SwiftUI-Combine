//
//  Responses.swift
//  PixabayPhotoViewer_SwiftUI
//
//  Created by home on 2020/07/27.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import Foundation

struct ImageResponse: Codable {
    var hits: [Hits]
    struct Hits: Codable {
        var id: Int
        var previewURL: String
        var tags: String
        var user: String
        var webformatURL: String
    }
}
