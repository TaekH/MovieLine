//
//  MovieList.swift
//  MyMovieQuotes
//
//  Created by 한택환 on 2022/04/28.
//

import SwiftUI

struct MovieList: View {
    
    var moviePoster: [MovieInfo]
    
       
       //화면을 그리드형식으로 꽉채워줌
       let columns = [
        GridItem(.adaptive(minimum: (UIScreen.main.bounds.width - 60) / 2))
       ]
    let randomIndex = [9]
    //let posters = [MoviePoster(moviePoster: movieInfo[0]), MovieQuoteInList(moviePoster: movieInfo[0])]
    var body: some View {
        
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(0..<10) {index in
                    MoviePoster(moviePoster: moviePoster[randomIndex.randomElement()!])
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList(moviePoster: movieInfo)
    }
}
