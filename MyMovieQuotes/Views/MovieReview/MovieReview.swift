//
//  MovieReview.swift
//  MyMovieQuotes
//
//  Created by 한택환 on 2022/04/28.
//

import SwiftUI

struct MovieReview: View {
    
    var movieInfo: MovieInfo
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    //포스터
                    ZStack(alignment: .top) {
                        movieInfo.poster
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width)
                            .clipped()
                        Rectangle()
                            .fill(.black)
                            .opacity(0.7)
                            .mask(LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .top, endPoint: .bottom))
                            .frame(width: UIScreen.main.bounds.width, height: 100)
                    }
                    //명대사, 별점, 글쓰기
                    HStack(alignment: .center) {
                        Text(movieInfo.quote)
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .padding(.all, 8)
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 0){
                            HStack(alignment: .top, spacing: 0){
                                Image(systemName: "star.fill")
                                Text(movieInfo.starrating)
                            }
                            .font(.system(size: 15))
                            .foregroundColor(Color("starRatingColor"))
                            .padding(.all, 8)
                            
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(Color.gray)
                                .font(.system(size: 15))
                                .padding(.all, 8)
                        }
                    }
                    
                    Divider()
                    
                    Text("<\(movieInfo.title), \(movieInfo.release)>\n등장인물 : \(movieInfo.cast)\n감독 : \(movieInfo.director)\n<예고 (Youtube)>")
                        .foregroundColor(Color("tabBarColor"))
                        .font(.system(size: 17))
                        .padding(8)
                    VideoEmbed(movieTrailer: movieInfo.trailer)
                        .frame(height: UIScreen.main.bounds.height / 4)
                    
                    Divider()
                    
//                    Text("감상평")
//                        .font(.system(size: 20))
//                        .fontWeight(.bold)
//                    Text("adfs\n\n\n\n\n\n\n")
                    Spacer()
                }
            }.edgesIgnoringSafeArea(.all)
                .navigationBarItems(leading: Text(movieInfo.title)
                    .fontWeight(.bold)
                    .font(.system(size: 35))
                    .allowsTightening(true)
                    .foregroundColor(.white), trailing:
                                        Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                }
                    .font(.system(size: 25))
                    .foregroundColor(Color("informationColor"))
                )
            
        }
        
    }
}

struct MovieReview_Previews: PreviewProvider {
    static var previews: some View {
        MovieReview(movieInfo: movieInfo[0])
    }
}
