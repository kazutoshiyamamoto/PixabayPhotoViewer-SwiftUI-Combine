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
        NavigationView {
            List {
                searchField
                
                if !viewModel.dataSource.isEmpty {
                    imageListSection
                } else {
                    loadingSection
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Pixabay")
        }
    }
}

private extension ImageListView {
    var searchField: some View {
        HStack(alignment: .center) {
            Image(systemName: "magnifyingglass")
            TextField("Search Images", text: $viewModel.searchWord)
        }
    }
    
    var imageListSection: some View {
        Section {
            ForEach(viewModel.dataSource) { item in
                NavigationLink(destination: self.viewModel.imageDetailView(id: item.id)) {
                    ImageListRow(viewModel: item)
                }
            }
        }
    }
    
    var loadingSection: some View {
        Section {
            Text("Loading...")
                .foregroundColor(.gray)
        }
    }
}
