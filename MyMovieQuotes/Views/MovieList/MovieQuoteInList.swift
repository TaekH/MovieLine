//
//  MovieQuoteInList.swift
//  MyMovieQuotes
//
//  Created by 한택환 on 2022/05/01.
//

import SwiftUI

struct MovieQuoteInList: View {
    
    var moviePoster: MovieInfo
    var posterWidth: CGFloat
    var posterHeight: CGFloat
    
    var body: some View {
        ZStack {
            Image(moviePoster.posterName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .blur(radius: 4)
                .frame(width: posterWidth, height: posterHeight)
                .clipped()
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .opacity(0.2)
                )
            Text(moviePoster.quote[0])
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 15))
                .frame(width: posterWidth, height: posterHeight)

                

        }
    }
}

//struct MovieQuoteInList_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieQuoteInList(moviePoster: movieInfo[0])
//    }
//}
