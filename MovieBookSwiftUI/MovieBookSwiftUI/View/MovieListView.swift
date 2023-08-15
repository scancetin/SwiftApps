//
//  ContentView.swift
//  MovieBookSwiftUI
//
//  Created by Can Cetin on 13.08.2023.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var movieListViewModel : MovieListViewModel
    @State var searchBar = ""
    
    init() {
        self.movieListViewModel = MovieListViewModel()
        self.movieListViewModel.searchMovie(movieName: "avatar")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search a movie", text: $searchBar, onEditingChanged: {_ in}, onCommit: {
                    self.movieListViewModel.searchMovie(movieName: searchBar)
                }).padding()
                    .textFieldStyle(.roundedBorder)
                
                List(movieListViewModel.movieList, id: \.imdbId) {movie in
                    NavigationLink(destination: {
                        DetailsView(imdbID: movie.imdbId)
                    }, label: {
                        HStack(alignment: .top) {
                            ImageComponent(url: movie.poster)
                                .frame(width: 100, height: 150)
                            
                            VStack(alignment: .leading) {
                                Text(movie.title)
                                    .font(.title3)
                                    .foregroundColor(.blue)
                                    .padding(.vertical)
                                Text(movie.year)
                                    .foregroundColor(.red)
                            }
                        }
                    })
                    
                }.navigationTitle(Text("Movie List"))
            }
            
        }
        
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
