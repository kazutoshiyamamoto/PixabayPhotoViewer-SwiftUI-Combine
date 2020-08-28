//
//  ImageDetailView.swift
//  PixabayPhotoViewer_SwiftUI
//
//  Created by home on 2020/08/13.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import SwiftUI

// 画像詳細画面
struct ImageDetailView: View {
    @ObservedObject var viewModel: ImageDetailViewModel
    
    init(viewModel: ImageDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(content: content)
            .onAppear(perform: viewModel.loadImageDetail)
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
    
    // 画像詳細を表示するViewを生成
    func makeImageDetailView(viewModel: ImageDetailRowViewModel) -> some View {
        ImageDetailRowView(viewModel: viewModel)
    }
    
    // ロード中に表示するView
    var loadingView: some View {
        Text("Loading...")
            .foregroundColor(.gray)
    }
}
