//
//  ImageListViewModel.swift
//  PixabayPhotoViewer_SwiftUI
//
//  Created by home on 2020/08/06.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import SwiftUI
import Combine

class ImageListViewModel: ObservableObject {
    @Published var searchWord: String = ""
    @Published var dataSource: [ImageListRowViewModel] = []
    @Published var isLastPageReached: Bool = false
    
    private let imageFetcher: ImageFetchable
    private var disposables = [AnyCancellable]()
    private var page = 1
    
    init(imageFetcher: ImageFetchable, scheduler: DispatchQueue = DispatchQueue(label: "ImageListViewModel")) {
        self.imageFetcher = imageFetcher
        
        let _fetchImage = PassthroughSubject<String, Never>()
        
        // 検索ワードが入力されるごとに_fetchImageへ入力された値を送信
        $searchWord
            .debounce(for: .seconds(1.0), scheduler: scheduler)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: {
                self.dataSource = []
                self.page = 1
                _fetchImage.send($0)
            })
            .store(in: &disposables)
        
        // 画像情報を取得
        _fetchImage
            .map { searchWord -> AnyPublisher<Result<[ImageListRowViewModel], ImageError>, Never> in
                imageFetcher.fetchImageList(searchWord: searchWord, page: self.page)
                    .prefix(1)
                    .map {
                        Result.success(
                            $0.hits.map(ImageListRowViewModel.init)
                        )
                }
                .catch { Just(Result.failure($0)) }
                .eraseToAnyPublisher()
        }
        .switchToLatest()
        .receive(on: DispatchQueue.main)
        .sink(receiveValue: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(images):
                self.dataSource = images
                
            case .failure:
                self.dataSource = []
            }
        })
            .store(in: &disposables)
    }
    
    // 次のページの画像を取得
    func loadNext() {
        if !self.isLastPageReached {
            self.page += 1
            
            imageFetcher
                .fetchImageList(searchWord: searchWord, page: self.page)
                .map { $0.hits.map(ImageListRowViewModel.init) }
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    switch value {
                    case .failure:
                        self.isLastPageReached = true
                    case .finished:
                        break
                    }
                    }, receiveValue: { [weak self] images in
                        guard let self = self else { return }
                        self.dataSource += images
                })
                .store(in: &disposables)
        }
    }
}

extension ImageListViewModel {
    // 画像詳細画面を生成
    func makeImageDetailView(id: Int) -> some View {
        let viewModel = ImageDetailViewModel(id: id, imageFetcher: imageFetcher)
        return ImageDetailView(viewModel: viewModel)
    }
}
