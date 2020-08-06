//
//  ImageListViewModel.swift
//  PixabayPhotoViewer_SwiftUI
//
//  Created by home on 2020/08/06.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import SwiftUI
import Combine

class ImageListViewModel: ObservableObject {
    @Published var searchWord: String = ""
    @Published var dataSource: [ImageListRowViewModel] = []
    }
}
