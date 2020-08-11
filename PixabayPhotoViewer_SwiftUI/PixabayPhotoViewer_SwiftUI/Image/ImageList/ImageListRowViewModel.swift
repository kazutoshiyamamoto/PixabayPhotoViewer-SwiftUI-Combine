//
//  ImageListRowViewModel.swift
//  PixabayPhotoViewer_SwiftUI
//
//  Created by home on 2020/07/29.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import Foundation
import Combine

struct ImageListRowViewModel: Identifiable {
    private let hits: ImageListResponse.Hits
    
    var id: Int {
        return hits.id
    }
    
    var tags: String {
        return hits.tags
    }
    
    var user: String {
        return hits.user
    }
    
    var previewURL: String {
        return hits.previewURL
    }
    
    init(hits: ImageListResponse.Hits) {
        self.hits = hits
    }
}
