//
//  MovieDetailsModel.swift
//  MovieBookSwiftUI
//
//  Created by Can Cetin on 15.08.2023.
//

import Foundation

struct MovieDetailsModel : Codable {
    let title : String
    let year : String
    let genre : String
    let director : String
    let plot : String
    let poster : String
    let metascore : String
    let imdbRating : String
    let imdbID : String
    
    private enum CodingKeys : String, CodingKey {
        case title = "Title"
        case year = "Year"
        case genre = "Genre"
        case director = "Director"
        case plot = "Plot"
        case poster = "Poster"
        case metascore = "Metascore"
        case imdbRating = "imdbRating"
        case imdbID = "imdbID"
    }
}
