//
//  MovieViewModel.swift
//  MovieBookSwiftUI
//
//  Created by Can Cetin on 14.08.2023.
//

import Foundation

struct MovieViewModel {
    let movie : MovieModel
    
    var title : String {
        movie.title
    }
    
    var year : String {
        movie.year
    }
    
    var poster : String {
        movie.poster
    }
    
    var imdbId : String {
        movie.imdbId
    }
}
