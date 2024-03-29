//
//  MovieModel.swift
//  MovieBookSwiftUI
//
//  Created by Can Cetin on 13.08.2023.
//

import Foundation

struct MovieModel : Codable {
    let title : String
    let year : String
    let imdbId : String
    let type : String
    let poster : String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}

struct MovieListModel : Codable {
    let movieList : [MovieModel]
    
    private enum CodingKeys: String, CodingKey {
        case movieList = "Search"
    }
}
