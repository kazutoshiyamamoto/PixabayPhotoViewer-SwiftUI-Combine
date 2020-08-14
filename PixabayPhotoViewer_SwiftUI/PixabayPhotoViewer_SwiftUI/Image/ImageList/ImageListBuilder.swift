//
//  ImageListBuilder.swift
//  PixabayPhotoViewer_SwiftUI
//
//  Created by home on 2020/08/14.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import SwiftUI

enum ImageListBuilder {
    static func makeImageDetailView(id: Int, imageFetcher: ImageFetchable) -> some View {
        let viewModel = ImageDetailViewModel(id: id, imageFetcher: imageFetcher)
        return ImageDetailView(viewModel: viewModel)
    }
}
