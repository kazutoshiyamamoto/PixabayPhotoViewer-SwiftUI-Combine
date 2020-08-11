//
//  ImageDetailViewModel.swift
//  PixabayPhotoViewer_SwiftUI
//
//  Created by home on 2020/08/11.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import Foundation

struct ImageDetailViewModel {
    private let hits: ImageDetailResponse.Hits
    
    var tags: String {
        return hits.tags
    }
    
    var views: Int {
        return hits.views
    }
    
    var favorites: Int {
        return hits.favorites
    }
    
    var likes: Int {
        return hits.likes
    }
    
    var user: String {
        return hits.user
    }
    
    var webformatURL: String {
        return hits.webformatURL
    }
    
    init(hits: ImageDetailResponse.Hits) {
        self.hits = hits
    }
}
