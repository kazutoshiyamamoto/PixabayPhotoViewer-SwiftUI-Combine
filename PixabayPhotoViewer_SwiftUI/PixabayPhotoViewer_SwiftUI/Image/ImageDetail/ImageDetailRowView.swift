//
//  ImageDetailRowView.swift
//  PixabayPhotoViewer_SwiftUI
//
//  Created by home on 2020/08/12.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import SwiftUI

struct ImageDetailRowView: View {
    private let viewModel: ImageDetailRowViewModel
    
    init(viewModel: ImageDetailRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            ImageView(imageLoader: ImageLoader(url: URL(string: viewModel.webformatURL)!))
                
            HStack {
                Image(systemName: "tag.fill")
                Text(viewModel.tags)
                    .foregroundColor(.gray)
            }
            
            HStack {
                Image(systemName: "eye.fill")
                Text("\(viewModel.views)")
                    .foregroundColor(.gray)
            }
            
            HStack {
                Image(systemName: "hand.thumbsup.fill")
                Text("\(viewModel.likes)")
                    .foregroundColor(.gray)
            }
            
            HStack {
                Image(systemName: "star.fill")
                Text("\(viewModel.favorites)")
                    .foregroundColor(.gray)
            }
        }
    }
}
