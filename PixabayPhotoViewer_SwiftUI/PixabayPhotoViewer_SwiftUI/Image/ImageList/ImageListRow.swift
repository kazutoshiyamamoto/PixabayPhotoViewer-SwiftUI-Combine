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
            Text(viewModel.tags)
            Text(viewModel.user)
        }
    }
}
