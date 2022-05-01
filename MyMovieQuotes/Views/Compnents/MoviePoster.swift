//
//  MoviePoster.swift
//  MyMovieQuotes
//
//  Created by 한택환 on 2022/04/28.
//

import SwiftUI

struct MoviePoster: View {
    var moviePoster: MovieInfo
    let moviePosterWidth: CGFloat = (UIScreen.main.bounds.width - 60) / 2
    
    var body: some View {
        moviePoster.poster
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: moviePosterWidth)
            .cornerRadius(10)
    }
}

struct MoviePoster_Previews: PreviewProvider {
    static var previews: some View {
        MoviePoster(moviePoster: movieInfo[0])
    }
}
