//
//  ImageError.swift
//  PixabayPhotoViewer_SwiftUI
//
//  Created by home on 2020/07/27.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import Foundation

enum ImageError: Error {
  case parsing(description: String)
  case network(description: String)
}
