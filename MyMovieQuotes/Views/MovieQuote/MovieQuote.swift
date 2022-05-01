//
//  MovieQuote.swift
//  MyMovieQuotes
//
//  Created by 한택환 on 2022/04/28.
//

import SwiftUI

struct MovieQuote: View {
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                MovieQuotePoste(movieInfo: movieInfo[0])
                
                Text("다른 콘텐츠")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .padding(10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(0..<10) { index in
                            MoviePoster(moviePoster: movieInfo[index])
                                .padding(.trailing, 10)
                        }
                    }
                    .padding(.leading, 10)
                }
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("영화")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct MovieQuote_Previews: PreviewProvider {
    static var previews: some View {
        MovieQuote()
    }
}
