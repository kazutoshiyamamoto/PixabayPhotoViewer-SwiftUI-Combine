//
//  ImageRow.swift
//  PixabayPhotoViewer_SwiftUI
//
//  Created by home on 2020/07/21.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import SwiftUI

struct ImageRow: View {
    var imageOverview: ImageOverview
    
    var body: some View {
        HStack {
            Image(imageOverview.previewURL)
                .resizable()
                .frame(width: 80.0, height: 80.0)
            Text(imageOverview.user)
            Text(imageOverview.tag)
            Spacer()
        }
    }
}

struct ImageRow_Previews: PreviewProvider {
    static var previews: some View {
        ImageRow(imageOverview: Image().imageOverviews[0])
            .previewLayout(.fixed(width: 300.0, height: 80.0))
    }
}
