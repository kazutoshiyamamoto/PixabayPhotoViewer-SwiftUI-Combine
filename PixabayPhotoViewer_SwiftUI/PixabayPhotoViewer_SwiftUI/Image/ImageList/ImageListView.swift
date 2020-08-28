//
//  ContentView.swift
//  PixabayPhotoViewer_SwiftUI
//
//  Created by home on 2020/07/17.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import SwiftUI

// 画像一覧画面
struct ImageListView: View {
    @ObservedObject var viewModel: ImageListViewModel
    
    init(viewModel: ImageListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                searchField
                
                if !viewModel.dataSource.isEmpty {
                    imageListSection
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Pixabay")
        }
    }
}

private extension ImageListView {
    // 検索ワードを入力するTextField
    var searchField: some View {
        HStack(alignment: .center) {
            Image(systemName: "magnifyingglass")
            TextField("Search Images", text: $viewModel.searchWord)
        }
    }
    
    // 画像一覧を表示するセクション
    var imageListSection: some View {
        Section {
            ForEach(viewModel.dataSource) { item in
                NavigationLink(destination: self.viewModel.makeImageDetailView(id: item.id)) {
                    ImageListRow(viewModel: item)
                }
            }
            
            // 最後のページに到達していなければ次のページを読み込み表示
            if !viewModel.isLastPageReached {
                Text("Loading...")
                    .onAppear(perform: {
                        self.viewModel.loadNext()
                    })
            }
        }
    }
}
