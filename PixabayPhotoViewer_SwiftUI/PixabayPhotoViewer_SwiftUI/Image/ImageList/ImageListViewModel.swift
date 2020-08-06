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
    
    private let imageFetcher: ImageFetchable
    private var disposables = [AnyCancellable]()
    
    init(imageFetcher: ImageFetchable, scheduler: DispatchQueue = DispatchQueue(label: "ImageListViewModel")) {
        self.imageFetcher = imageFetcher
        
        let _fetchImage = PassthroughSubject<String, Never>()
        
        $searchWord
            .filter{ !$0.isEmpty }
            .debounce(for: .seconds(0.5), scheduler: scheduler)
            .sink(receiveValue: { _fetchImage.send($0) })
            .store(in: &disposables)
        
        _fetchImage
            .map { searchWord -> AnyPublisher<Result<[ImageListRowViewModel], ImageError>, Never> in
                imageFetcher.fetchImage(searchWord: searchWord)
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
}
