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
        List(content: content)
            .onAppear(perform: viewModel.refresh)
            .navigationBarTitle(viewModel.dataSource?.user ?? "")
            .listStyle(GroupedListStyle())
    }
}

private extension ImageDetailView {
    func content() -> some View {
        if let viewModel = viewModel.dataSource {
            return AnyView(makeImageDetailView(viewModel: viewModel))
        } else {
            return AnyView(loadingView)
        }
    }
    
    func makeImageDetailView(viewModel: ImageDetailRowViewModel) -> some View {
        ImageDetailRowView(viewModel: viewModel)
    }
    
    var loadingView: some View {
        Text("Loading...")
            .foregroundColor(.gray)
    }
}
