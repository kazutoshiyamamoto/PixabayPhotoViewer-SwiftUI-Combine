# PixabayPhotoViewer_SwiftUI
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
