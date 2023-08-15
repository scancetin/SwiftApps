//
//  MovieDetailsViewModel.swift
//  MovieBookSwiftUI
//
//  Created by Can Cetin on 15.08.2023.
//

import Foundation

class DetailsViewModel : ObservableObject {
    @Published var details : MovieDetailsViewModel?
    
    let downloaderClient = DownloaderClient()
    
    func getMovieDetails(imdbID: String) {
        downloaderClient.downloadMovieDetails(imdbID: imdbID) {result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let movieDetails):
                DispatchQueue.main.async {
                    self.details = MovieDetailsViewModel(details: movieDetails)
                }
            }
        }
    }
    
}

struct MovieDetailsViewModel {
    let details : MovieDetailsModel
    
    var title : String {
        details.title
    }
    
    var year : String {
        details.year
    }
    
    var genre : String {
        details.genre
    }
    
    var director : String {
        details.director
    }
    
    var plot : String {
        details.plot
    }
    
    var metascore : String {
        details.metascore
    }
    
    var imdbRating : String {
        details.imdbRating
    }
    
    var imdbID : String {
        details.imdbID
    }
    
    var poster : String {
        details.poster
    }
}
