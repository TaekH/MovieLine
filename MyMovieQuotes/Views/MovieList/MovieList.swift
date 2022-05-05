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
    let posterWidth = (UIScreen.main.bounds.width - 60) / 2
    var posterHeight: CGFloat { posterWidth * 1.5 }
    
    @State var isPresented = false
    @State var randomIndex = [0,1,2,3,4,5,6,7,8,9].shuffled()
    //[1,3,5,0,..]
    //@State var selectedIndex: Int

    var body: some View {
        var selectedIndex: Int = 0
        
        NavigationView {
            VStack {
                //Divider()
                ScrollView {
                    HStack(alignment: .top, spacing: 0) {
                        
                        LazyVStack(spacing: 0) {
                            
                            ForEach(0..<moviePoster.count / 2) { index in
                                let randomPosterIndex = Int.random(in: 0...1)
                                //randomPosterIndex 가 1이면 그냥 포스터
                                if randomPosterIndex == 1 {
                                    
                                    MoviePoster(moviePoster: moviePoster[randomIndex[index]], posterWidth: posterWidth, posterHeight: posterHeight)
                                        .onTapGesture {
                                            withAnimation {
                                                selectedIndex = index
                                                isPresented.toggle()
                                            }
                                        }
                                }
                                else {
                                    MovieQuoteInList(moviePoster: moviePoster[randomIndex[index]], posterWidth: posterWidth, posterHeight: CGFloat.random(in: posterWidth...300))
                                        .onTapGesture {
                                            withAnimation {
                                                selectedIndex = index
                                                isPresented.toggle()
                                            }
                                        }
                                }
                                
                            }
                            .padding(.vertical, 10)
                            
                        }
                        
                        LazyVStack(spacing: 0) {
                            
                            ForEach(moviePoster.count / 2..<moviePoster.count) { index2 in
                                let randomPosterIndex = Int.random(in: 0...1)
                                
                                if randomPosterIndex == 0 {
                                    MoviePoster(moviePoster: moviePoster[randomIndex[index2]], posterWidth: posterWidth, posterHeight: posterHeight)
                                        .onTapGesture {
                                            selectedIndex = index2
                                            withAnimation {
                                                print(randomIndex[index2])
                                                isPresented.toggle()
                                            }
                                        }
                                }
                                else {
                                    MovieQuoteInList(moviePoster: moviePoster[randomIndex[index2]], posterWidth: posterWidth, posterHeight: CGFloat.random(in: posterWidth...300))
                                        .onTapGesture {
                                            withAnimation {
                                                selectedIndex = index2
                                                isPresented.toggle()
                                            }
                                        }
                                }
                            }.padding(.vertical, 10)
                        }
                    }
                    .fullScreenCover(isPresented: $isPresented) {
                        MovieReview(movieInfo: moviePoster[randomIndex[selectedIndex]])
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
