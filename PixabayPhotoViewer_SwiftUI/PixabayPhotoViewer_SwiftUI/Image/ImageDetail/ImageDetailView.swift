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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ImageDetailView()
    }
}
