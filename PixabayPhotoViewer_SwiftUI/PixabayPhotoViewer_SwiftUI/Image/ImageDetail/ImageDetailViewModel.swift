//
//  ImageDetailViewModel.swift
//  PixabayPhotoViewer_SwiftUI
//
//  Created by home on 2020/08/12.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import SwiftUI
import Combine

class ImageDetailViewModel: ObservableObject, Identifiable {
    @Published var dataSource: ImageDetailRowViewModel?
    
    // 画像のID
    let id: Int
    private let imageFetcher: ImageFetchable
    private var disposables = Set<AnyCancellable>()
    
    init(id: Int, imageFetcher: ImageFetchable) {
        self.id = id
        self.imageFetcher = imageFetcher
    }
    
    // 画像詳細情報を取得
    func loadImageDetail() {
        imageFetcher
            .fetchImageDetail(id: id)
            .map { $0.hits.map(ImageDetailRowViewModel.init) }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.dataSource = nil
                case .finished:
                    break
                }
                }, receiveValue: { [weak self] image in
                    guard let self = self else { return }
                    self.dataSource = image[0]
            })
            .store(in: &disposables)
    }
}
