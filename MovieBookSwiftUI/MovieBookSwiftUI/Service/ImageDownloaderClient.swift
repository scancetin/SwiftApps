//
//  ImageDownloaderClient.swift
//  MovieBookSwiftUI
//
//  Created by Can Cetin on 15.08.2023.
//

import Foundation

class ImageDownloaderClient : ObservableObject{
    @Published var downloadedImage : Data?
    
    func downloadImage(url: String) {
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) {data,response,error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.downloadedImage = data
            }
        }.resume()
    }
    
}
