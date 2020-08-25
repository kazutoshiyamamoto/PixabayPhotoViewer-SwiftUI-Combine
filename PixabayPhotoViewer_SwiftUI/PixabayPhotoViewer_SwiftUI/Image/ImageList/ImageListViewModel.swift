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
        
        $searchWord
            .debounce(for: .seconds(1.0), scheduler: scheduler)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: {
                _fetchImage.send($0)
                self.dataSource = []
                self.page = 1
            })
            .store(in: &disposables)
        
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
    func imageDetailView(id: Int) -> some View {
        let viewModel = ImageDetailViewModel(id: id, imageFetcher: imageFetcher)
        return ImageDetailView(viewModel: viewModel)
    }
}
