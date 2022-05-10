//
//  MovieQuote.swift
//  MyMovieQuotes
//
//  Created by 한택환 on 2022/04/28.
//
//영화 명대사 뷰
import SwiftUI

struct MovieQuote: View {
    //MARK: 다른 영화 포스터 사이즈
    let posterWidth = UIScreen.main.bounds.width / 2.85
    let posterHeight = UIScreen.main.bounds.height / 4.13
    
    @State var currentIndex: Int = 0 //선택한 다른 포스터 인덱스 저장 변수
    @State var isPresented = false
    
    //MARK: 현재시각 변수, 포메터 변수 (년,월,일 단위로 변경)
    @State var currentDate = Date()
    
    var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }
    //
    
    
    
    var body: some View {
        
        
        NavigationView {
            
            
            VStack(alignment: .leading, spacing: 0) {
                //MARK: 메인 영화 포스터, 명대사 뷰 로드
                MovieQuotePoste(movieInfo: movieInfo[currentIndex], isPresented: isPresented)
                //MARK: 다른 영화 포스터 스크롤 뷰
                Text("다른 콘텐츠")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .padding(10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 0) {
                        
                        ForEach(0..<10) { index in
                            MoviePoster(moviePoster: movieInfo[index], posterWidth: posterWidth, posterHeight: posterHeight)
                                .padding(.trailing, 10)
                                .gesture(
                                TapGesture()
                                    .onEnded{
                                        currentIndex = index
                                    }
                                )
                        }
                        
                    }
                    .padding(.leading, 10)
                    
                }
                Spacer()
                
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarItems(leading: VStack(alignment: .leading){
                Text("\(currentDate, formatter: dateFormatter)")
                    .foregroundColor(Color("customLightGrayColor"))
                    .fontWeight(.bold)
                    .font(.system(size: 13))
                Text("영화")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 35))
            }.padding(.top, 50), trailing: MyMemoji().padding(.top, 50))
        }
    }
}

struct MovieQuote_Previews: PreviewProvider {
    static var previews: some View {
        MovieQuote()
    }
}
