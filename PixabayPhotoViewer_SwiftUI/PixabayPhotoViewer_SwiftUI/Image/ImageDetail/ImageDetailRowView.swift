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
        VStack(alignment: .leading) {
            ImageView(imageLoader: ImageLoader(url: URL(string: viewModel.webformatURL)!))
                
            HStack {
                Text("tags:")
                Text(viewModel.tags)
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("views:")
                Text("\(viewModel.views)")
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("favorites:")
                Text("\(viewModel.favorites)")
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("likes:")
                Text("\(viewModel.likes)")
                    .foregroundColor(.gray)
            }
        }
    }
}
