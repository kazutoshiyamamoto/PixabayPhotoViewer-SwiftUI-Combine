//
//  ImageListRow.swift
//  PixabayPhotoViewer_SwiftUI
//
//  Created by home on 2020/07/31.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import SwiftUI

struct ImageListRow: View {
    private let viewModel: ImageListRowViewModel
    
    init(viewModel: ImageListRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            ImageView(imageLoader: ImageLoader(url: URL(string: viewModel.previewURL)!))
                .frame(width: 100.0, height: 100.0)
            VStack(alignment: .leading) {
                HStack {
                    Text("user:")
                    Text(viewModel.user)
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Text("tag:")
                    Text(viewModel.tags)
                        .foregroundColor(.gray)
                }
            }
        }
        .frame(height: 70.0)
    }
}
