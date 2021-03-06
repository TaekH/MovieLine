//
//  MoviePoster.swift
//  MyMovieQuotes
//
//  Created by 한택환 on 2022/04/28.
//

import SwiftUI

struct MoviePoster: View {
    var moviePoster: MovieInfo
    var posterWidth: CGFloat
    var posterHeight: CGFloat
    
    var body: some View {
        Image(moviePoster.posterName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: posterWidth, height: posterHeight)
            .clipped()
            .cornerRadius(10)
    }
}
