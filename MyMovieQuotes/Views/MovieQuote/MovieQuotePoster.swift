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
    
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack() {
            movieInfo.poster
                .resizable()
                .scaledToFill()
                .blur(radius: 15, opaque: true)
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
                
                //MARK: StarRating
                Label(movieInfo.starrating, systemImage: "star.fill")
                    .font(.system(size: 20))
                    .foregroundColor(Color("starRatingColor"))
                    .padding(.all, 15)
                    .frame(width: g.size.width, height: g.size.height, alignment: .bottomLeading)
                
                //MARK: 더보기 버튼
                Button {
                    self.isPresented.toggle()
                } label: {
                    Text("더보기")
                }.foregroundColor(Color("informationColor"))
                    .font(.system(size: 20))
                    .padding(15)
                    .frame(width: g.size.width, height: g.size.height,  alignment: .bottom)

            }
            .frame(height: height)
        }
        
    }
}

struct MovieQuotePoste_Previews: PreviewProvider {
    static var previews: some View {
        MovieQuotePoste(movieInfo: movieInfo[0], isPresented: .constant(true))
    }
}
