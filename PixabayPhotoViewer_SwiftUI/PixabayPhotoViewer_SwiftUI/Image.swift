//
//  PhotoData.swift
//  PixabayPhotoViewer_SwiftUI
//
//  Created by home on 2020/07/18.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import Foundation

struct ImageOverview: Identifiable {
    var user: String
    var tag: String
    var previewURL: String
}

final class Image {
    var imageOverviews: [ImageOverview] = makeImageOverview()
    
    func makeImageOverview() -> [ImageOverview] {
        var imageOverviews: [ImageOverview] = []
        imageOverviews.append(ImageOverview(user: test1, tag: 1, previewURL: "https://pixabay.com/ja/photos/%E3%82%B7%E3%83%89%E3%83%8B%E3%83%BC-%E3%83%9D%E3%83%BC%E3%83%88-%E3%82%AA%E3%83%BC%E3%82%B9%E3%83%88%E3%83%A9%E3%83%AA%E3%82%A2-225571/"))
        imageOverviews.append(ImageOverview(user: test2, tag: 2, previewURL: "https://pixabay.com/ja/photos/%E6%98%9F-%E6%B3%8A-%E5%B1%B1-%E9%9D%92-%E7%B7%91-%E5%A4%A9%E3%81%AE%E5%B7%9D-1828208/")),
        imageOverviews.append(ImageOverview(user: test2, tag: 2, previewURL: "https://pixabay.com/ja/photos/%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9-%E5%85%89-%E5%A4%9C%E6%99%AF-%E9%83%BD%E5%B8%82-1928599/"))
        
        return imageOverviews
    }
}
