//
//  ContentView.swift
//  PixabayPhotoViewer_SwiftUI
//
//  Created by home on 2020/07/17.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import SwiftUI

struct ImageListView: View {
    @ObservedObject var viewModel: ImageListViewModel
    
    init(viewModel: ImageListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}
