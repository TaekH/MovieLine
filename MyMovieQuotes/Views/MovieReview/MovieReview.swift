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
    @State var showQuote = false
    var body: some View {
        GeometryReader { g in
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    
                    //MARK: 포스터 / 제목 / 탭 할시에 명대사 띄우기
                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                        movieInfo.poster
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width)
                            .clipped()
                            .onTapGesture {
                                self.showQuote.toggle()
                            }
                        
                    //리니어 그라디언트 사각형
                        
                        
                        //사진 탭 할시에 이벤트
                        if showQuote {
                            ZStack {
                                Rectangle()
                                    .fill(.black)
                                    .opacity(0.5)
                                    .frame(width: UIScreen.main.bounds.width)
                                
                                Text(movieInfo.quote)
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .lineSpacing(10)
                                    .frame(width: g.size.width, alignment: .center)
                                    .onTapGesture {
                                        self.showQuote.toggle()
                                    }
                            }
                            
                        }
                        
                    }
                    
                    //MARK: 명대사, 별점, 글쓰기
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text(movieInfo.title)
                                .fontWeight(.bold)
                                .font(.system(size: 25))
                                .padding(.all, 8)
                            HStack(spacing: 0) {
                                ForEach(0..<Int(movieInfo.starrating)) { index in
                                    Image(systemName: "star.fill")
                                        .font(.system(size: 15))
                                        .foregroundColor(Color("starRatingColor"))
                                }
                                
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Label("명대사 쓰기", systemImage: "square.and.pencil")
                                        .foregroundColor(Color.gray)
                                        .font(.system(size: 15))
                                        .padding(.all, 8)
                                }
                            }.padding(.init(top: 0, leading: 8, bottom: 8, trailing: 0))
                        }
                        

                            
                    
                    }
                    
                    Divider()
                    //MARK: 영화정보 및 유튜브 임베드
                    
                    Text("등장인물 : \(movieInfo.cast)\n감독 : \(movieInfo.director)\n개봉년도 : \(movieInfo.release)\n<예고 (Youtube)>")
                        .foregroundColor(Color("tabBarColor"))
                        .font(.system(size: 17))
                        .padding(8)
                    VideoEmbed(movieTrailer: movieInfo.trailer)
                        .frame(height: UIScreen.main.bounds.height / 3.5)
                    
                    Divider()
                    Spacer()
                }
            }
            //버튼 가려지지 않도록 상단 리니어 그라디언트 추가
//            Rectangle()
//                .fill(.black)
//                .opacity(0.7)
//                .mask(LinearGradient(gradient: Gradient(colors: [Color("customLightGrayColor"), .clear]), startPoint: .top, endPoint: .bottom))
//                .frame(width: g.size.width, height: 100)
            
            
            //MARK: 창닫기 버튼
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
            }
            .font(.system(size: 30))
            .foregroundColor(Color("closeButtonColor"))
            .padding(30)
            .frame(width: g.size.width, height: 120, alignment: .trailing)
            
            
            
            
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct MovieReview_Previews: PreviewProvider {
    static var previews: some View {
        MovieReview(movieInfo: movieInfo[0])
    }
}
