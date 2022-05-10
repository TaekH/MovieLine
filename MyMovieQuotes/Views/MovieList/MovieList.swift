//
//  MovieList.swift
//  MyMovieQuotes
//
//  Created by 한택환 on 2022/04/28.
//
//MARK: 영화 리스트 페이지
import SwiftUI

struct MovieList: View {
    
    
    var moviePoster: [MovieInfo2]
    
    /// 리스트 안의 포스터 너비, 높이
    let posterWidth = (UIScreen.main.bounds.width - 60) / 2
    var posterHeight: CGFloat { posterWidth * 1.5 }
    
    /// fullScreenCover 상태 변수
    @State var isPresented = false
    
    //MARK: 중복 없는 랜덤 인자가 들어간 배열
    func makeRandom()-> [Int] {
        var randomArray = [Int]()
        var number: Int
        while randomArray.count < moviePoster.count {
            number = Int.random(in: 0..<moviePoster.count)
            if !randomArray.contains(number) {
                randomArray.append(number)
            }
        }
        return randomArray
    }
    
    
    

    var body: some View {
        
        var selectedIndex: Int = 0
        let randomArray: [Int] = makeRandom()
        
        NavigationView {
            VStack {
                ScrollView {
                    HStack(alignment: .top, spacing: 0) {
                        
                        LazyVStack(spacing: 0) {
                            
                            ForEach(0..<moviePoster.count / 2) { index in
                                let randomPosterIndex = Bool.random()
                                //randomPosterIndex 가 1이면 그냥 포스터
                                if randomPosterIndex {
                                    MoviePoster(moviePoster: moviePoster[randomArray[index]], posterWidth: posterWidth, posterHeight: posterHeight)
                                        .onTapGesture {
                                            selectedIndex = index
                                            withAnimation {
                                                isPresented.toggle()
                                            }
                                        }
                                }
                                else {
                                    MovieQuoteInList(moviePoster: moviePoster[randomArray[index]], posterWidth: posterWidth, posterHeight: CGFloat.random(in: posterWidth...300))
                                        .onTapGesture {
                                            selectedIndex = index
                                            withAnimation {
                                                isPresented.toggle()
                                            }
                                        }
                                }
                                
                            }
                            .padding(.vertical, 10)
                            
                        }
                        
                        LazyVStack(spacing: 0) {
                            
                            ForEach(moviePoster.count / 2..<moviePoster.count) { index2 in
                                let randomPosterIndex = Bool.random()
                                
                                if randomPosterIndex {
                                    MoviePoster(moviePoster: moviePoster[randomArray[index2]], posterWidth: posterWidth, posterHeight: posterHeight)
                                        .onTapGesture {
                                            selectedIndex = index2
                                            withAnimation {
                                                isPresented.toggle()
                                            }
                                        }
                                }
                                else {
                                    MovieQuoteInList(moviePoster: moviePoster[randomArray[index2]], posterWidth: posterWidth, posterHeight: CGFloat.random(in: posterWidth...300))
                                        .onTapGesture {
                                            selectedIndex = index2
                                            withAnimation {
                                                isPresented.toggle()
                                            }
                                        }
                                }
                            }.padding(.vertical, 10)
                        }
                    }
                    .fullScreenCover(isPresented: $isPresented) {
                        MovieReview(movieInfo: moviePoster[randomArray[selectedIndex]])
                    }.padding(.horizontal, 10)
                }
                
            }
            .navigationTitle("영화 리스트")
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList(moviePoster: dummyMovie)
    }
}
