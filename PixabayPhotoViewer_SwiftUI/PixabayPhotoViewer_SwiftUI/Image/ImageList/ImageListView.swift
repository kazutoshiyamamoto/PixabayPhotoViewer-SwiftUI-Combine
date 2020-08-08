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
        List {
            searchField
            
            if !viewModel.dataSource.isEmpty {
                imageListSection
            } else {
                emptySection
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Pixabay")
    }
}

private extension ImageListView {
    var searchField: some View {
        HStack(alignment: .center) {
            TextField("画像を検索", text: $viewModel.searchWord)
        }
    }
    
    var imageListSection: some View {
        Section {
            ForEach(viewModel.dataSource, content: ImageListRow.init(viewModel:))
        }
    }
    
    var emptySection: some View {
        Section {
            Text("検索結果なし")
                .foregroundColor(.gray)
        }
    }
}
