//
//  DetailsView.swift
//  MovieBookSwiftUI
//
//  Created by Can Cetin on 15.08.2023.
//

import SwiftUI

struct DetailsView: View {
    let imdbID : String
    @ObservedObject var detailsVM = DetailsViewModel()
    
    
    var body: some View {
        VStack(alignment: .center) {
            ImageComponent(url: detailsVM.details?.poster ?? "loading")
                .frame(width: 200, height: 300)
            
            Text(detailsVM.details?.plot ?? "Movies plot...")
            Spacer()
            
            
        }.onAppear(perform: {
                self.detailsVM.getMovieDetails(imdbID: imdbID)
            })
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(imdbID: "tt123")
    }
}
