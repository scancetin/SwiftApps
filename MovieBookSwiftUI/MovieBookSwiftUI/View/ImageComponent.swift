//
//  ImageComponent.swift
//  MovieBookSwiftUI
//
//  Created by Can Cetin on 15.08.2023.
//

import SwiftUI

struct ImageComponent: View {
    let url: String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    
    init(url: String) {
        self.url = url
        self.imageDownloaderClient.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageDownloaderClient.downloadedImage {
            print("calisti")
            return Image(uiImage: UIImage(data: data)!).resizable()
        } else {
            return Image("loading").resizable()
        }
    }
}

struct ImageComponent_Previews: PreviewProvider {
    static var previews: some View {
        ImageComponent(url: "https://m.media-amazon.com/images/M/MV5BYjU5ZThjMjgtOGExNi00ZmUzLWFiN2QtNTQ3YmYwN2ExNjU1XkEyXkFqcGdeQXVyNDQyNzIwNDQ@._V1_SX300.jpg")
    }
}
