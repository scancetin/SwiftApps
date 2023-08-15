//
//  DownloaderClient.swift
//  MovieBookSwiftUI
//
//  Created by Can Cetin on 13.08.2023.
//

import Foundation

class DownloaderClient {
    
    func downloadMovieList(search: String, completion: @escaping (Result<[MovieModel], DownloaderError>) -> Void) {
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=69fc6809") else {
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.dataNotFound))
            }
            
            guard let movieResponse = try? JSONDecoder().decode(MovieListModel.self, from: data) else {
                return completion(.failure(.dataProcessError))
            }
            return completion(.success(movieResponse.movieList))
        }.resume()
    }
    
    func downloadMovieDetails(imdbID: String, completion: @escaping (Result<MovieDetailsModel, DownloaderError>) -> Void ){
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbID)&apikey=69fc6809") else {
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.dataNotFound))
            }
            
            guard let movieDetailsResponse = try? JSONDecoder().decode(MovieDetailsModel.self, from: data) else {
                return completion(.failure(.dataProcessError))
            }
            return completion(.success(movieDetailsResponse))
        }.resume()
    }
}

enum DownloaderError : Error{
    case wrongUrl
    case dataNotFound
    case dataProcessError
}
