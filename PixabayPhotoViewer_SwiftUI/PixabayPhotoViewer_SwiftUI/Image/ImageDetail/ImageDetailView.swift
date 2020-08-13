//
//  ImageDetailView.swift
//  PixabayPhotoViewer_SwiftUI
//
//  Created by home on 2020/08/13.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import SwiftUI

struct ImageDetailView: View {
    @ObservedObject var viewModel: ImageDetailViewModel
    
    init(viewModel: ImageDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
    }
}

    
    func details(viewModel: ImageDetailRowViewModel) -> some View {
        ImageDetailRowView(viewModel: viewModel)
    }
    
    var loading: some View {
        Text("画像の読み込み中です")
            .foregroundColor(.gray)
    }
}
