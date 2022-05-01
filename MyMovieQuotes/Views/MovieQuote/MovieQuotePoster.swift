//
//  MovieQuotePoste.swift
//  MyMovieQuotes
//
//  Created by 한택환 on 2022/04/28.
//

import SwiftUI

struct MovieQuotePoste: View {
    var movieInfo: MovieInfo
    var width:CGFloat = UIScreen.main.bounds.width
    var height:CGFloat = UIScreen.main.bounds.width * 1.25
    
    
    var body: some View {
        ZStack() {
            movieInfo.poster
                .resizable()
                .scaledToFill()
                .blur(radius: 15)
                .frame(width: width, height: height)
                .clipped()
            
            Rectangle()
                .fill(Color.black)
                .opacity(0.4)
                .frame(width: width, height: height)
            
            
            GeometryReader { g in
                    Text(movieInfo.quote)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .frame(width: g.size.width, height: g.size.height)
                    
                    HStack(spacing: 0) {
                        Group{
                            Image(systemName: "star.fill")
                            Text(movieInfo.starrating)
                        }
                        .font(.system(size: 20))
                        .foregroundColor(Color("starRatingColor"))
                        Spacer()
                        Group{
                            Image(systemName: "info.circle")
                                .foregroundColor(Color("informationColor"))
                                .font(.system(size: 20))
                            Text("정보")
                                .foregroundColor(.white)
                                .font(.system(size: 15))
                        }
                    }
                    .padding(.all, 15)
                    .frame(height: g.size.height, alignment: .bottom)
                    
            }
            .frame(height: height)
        }
    }
}

struct MovieQuotePoste_Previews: PreviewProvider {
    static var previews: some View {
        MovieQuotePoste(movieInfo: movieInfo[0])
    }
}
