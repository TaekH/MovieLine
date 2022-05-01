//
//  MovieQuoteInList.swift
//  MyMovieQuotes
//
//  Created by 한택환 on 2022/05/01.
//

import SwiftUI

struct MovieQuoteInList: View {
    
    var moviePoster: MovieInfo
    var moviePosterWidth: CGFloat = (UIScreen.main.bounds.width - 60) / 2
    
    var body: some View {
        ZStack {
            moviePoster.poster
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .blur(radius: 4)
                .frame(width: moviePosterWidth)
                .clipped()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .opacity(0.3)
                )
            Text(moviePoster.quote)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 13))

                

        }
    }
}

struct MovieQuoteInList_Previews: PreviewProvider {
    static var previews: some View {
        MovieQuoteInList(moviePoster: movieInfo[0])
    }
}
