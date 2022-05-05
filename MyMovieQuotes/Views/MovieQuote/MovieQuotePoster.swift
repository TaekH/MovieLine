//
//  MovieQuotePoste.swift
//  MyMovieQuotes
//
//  Created by 한택환 on 2022/04/28.
//

import SwiftUI

struct MovieQuotePoste: View {
    var movieInfo: MovieInfo2
    var width:CGFloat = UIScreen.main.bounds.width
    var height:CGFloat = UIScreen.main.bounds.width * 1.25
    @State var quoteIndex = 0
    @State var isPresented = false
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            //MARK: 영화 포스터 데이터
            Image(movieInfo.posterName)
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
                Text(movieInfo.quote[0])
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                    .frame(width: g.size.width, height: g.size.height)
                
                //MARK: StarRating
                Label(String(movieInfo.starrating), systemImage: "star.fill")
                    .font(.system(size: 20))
                    .foregroundColor(Color("starRatingColor"))
                    .padding(.all, 15)
                    .frame(width: g.size.width, height: g.size.height, alignment: .bottomLeading)
                
                //MARK: 더보기 버튼
                Button {
                    isPresented.toggle()
                } label: {
                    Text("영화 정보")
                        .fontWeight(.bold)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("customBlueColor"), lineWidth: 2)
                            .frame(width: 100, height: 30, alignment: .center)
                        )
                }.foregroundColor(Color("customBlueColor"))
                    .font(.system(size: 20))
                    .padding(15)
                    .frame(width: g.size.width, height: g.size.height,  alignment: .bottom)
                    .fullScreenCover(isPresented: $isPresented) {
                        MovieReview(movieInfo: movieInfo)
                    }
                
            }
            .frame(height: height)
        }
        
    }
}

struct MovieQuotePoste_Previews: PreviewProvider {
    static var previews: some View {
        MovieQuotePoste(movieInfo: dummyMovie[0], isPresented: false)
    }
}
