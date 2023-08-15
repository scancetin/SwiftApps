//
//  MovieListViewModel.swift
//  MovieBookSwiftUI
//
//  Created by Can Cetin on 14.08.2023.
//

import Foundation

class MovieListViewModel : ObservableObject{
    
    @Published var movieList = [MovieViewModel]()
    let downloaderClient = DownloaderClient()
    
    func searchMovie(movieName: String) {
        downloaderClient.downloadMovieList(search: movieName) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let list):
                DispatchQueue.main.async {
                    self.movieList = list.map(MovieViewModel.init)
                }
            }
        }
    }
}
