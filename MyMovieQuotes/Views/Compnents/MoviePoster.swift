//
//  MoviePoster.swift
//  MyMovieQuotes
//
//  Created by 한택환 on 2022/04/28.
//

import SwiftUI

struct MoviePoster: View {
    var moviePoster: MovieInfo
    
    var body: some View {
        Image(moviePoster.posterName)
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
    }
}

struct MoviePoster_Previews: PreviewProvider {
    static var previews: some View {
        MoviePoster(moviePoster: movieInfo[0])
    }
}
