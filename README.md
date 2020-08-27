# PixabayPhotoViewer_SwiftUI
![](https://img.shields.io/badge/platform-ios-lightgrey)
![](https://img.shields.io/badge/swift-5.2.4-orange)
![](https://img.shields.io/badge/license-MIT-green)
<br>
<br>
Pixabay PhotoPhotoer_SwiftUI is an image search app that uses the pixabay API.
<br>
This app is built on MVVM with SwiftUI and Combine.
<br>
<br>
![demo](https://raw.github.com/wiki/kazutoshiyamamoto/PixabayPhotoViewer_SwiftUI/images/PixabayPhotoViewer_SwiftUI.gif)
<br>
<br>
## Technical features
- Development environment: Xcode 11.5
- Development Language: Swift 5.2.4
- Frameworks： SwiftUI,Combine
- Architecture： MVVM
- Library Management: CocoaPods 1.9.3
- Library: Nuke 9.1.2
## Directory structure
```
PixabayPhotoViewer_SwiftUI
├── Image
│   ├── ImageDetail
│   │   ├── ImageDetailRowView.swift
│   │   ├── ImageDetailRowViewModel.swift
│   │   ├── ImageDetailView.swift
│   │   └── ImageDetailViewModel.swift
│   ├── ImageList
│   │   ├── ImageListBuilder.swift
│   │   ├── ImageListRow.swift
│   │   ├── ImageListRowViewModel.swift
│   │   ├── ImageListView.swift
│   │   └── ImageListViewModel.swift
│   └── PixabayAPI
│       ├── ImageError.swift
│       ├── ImageFetcher.swift
│       ├── ImageLoader.swift
│       └── Responses.swift
├── Preview\ Content
│   └── Preview\ Assets.xcassets
│       └── Contents.json
├── SupportingFiles
│   ├── AppDelegate.swift
│   ├── Assets.xcassets
│   │   ├── AppIcon.appiconset
│   │   │   └── Contents.json
│   │   └── Contents.json
│   ├── Base.lproj
│   │   └── LaunchScreen.storyboard
│   ├── Info.plist
│   └── SceneDelegate.swift
└── Utilities
    ├── Parsing
    │   └── Parsing.swift
    └── UI
        └── ImageView.swift
```
※The structure of "PixabayPhotoViewer_SwiftUI.xcodeproj", "PixabayPhotoViewer_SwiftUI.xcworkspace", "Pods" is omitted.
## Try to search
### Required version
- Xcode 11.5+
- Swift 5.2.4+
- iOS 13.5+
### API key
An API key is required to search for images in the app.
<br>
Please login to [Pixabay](https://pixabay.com/) to get the API key.
<br>
<br>
Set the API key:
<br>
ImageFetcher.swift
<br>
```
struct PixabayAPI {
    static let scheme = "https"
    static let host = "pixabay.com"
    static let path = "/api/"
    static let key = "{APIKey}"
}
```
## Reference articles
- https://developer.apple.com/documentation/swiftui
- https://developer.apple.com/documentation/combine
- https://github.com/kean/Nuke
- https://pixabay.com/api/docs/
- https://github.com/manchan/MVVM-with-Combine-Tutorial-for-iOS
- https://stackoverflow.com/questions/59868393/swiftui-pagination-for-list-object
## License
PixabayPhotoViewer_SwiftUI is available under the MIT license.
