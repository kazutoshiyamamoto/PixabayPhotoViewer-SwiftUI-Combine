//
//  ImageView.swift
//  PixabayPhotoViewer_SwiftUI
//
//  Created by home on 2020/08/08.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import SwiftUI

// 画像を表示するView
struct ImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    
    var body: some View {
        Image(uiImage: imageLoader.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipped()
    }
}
