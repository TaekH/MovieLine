//
//  MovieList.swift
//  MyMovieQuotes
//
//  Created by 한택환 on 2022/04/28.
//

import SwiftUI

struct MovieList: View {
    
    var moviePoster: [MovieInfo]
    let posterWidth = (UIScreen.main.bounds.width - 60) / 2
    
    @State var isPresented = false
    @State var randomIndex = [0,1,2,3,4,5,6,7,8,9].shuffled()
    @State var selectedIndex = 0

    var body: some View {
        
        
        NavigationView {
            VStack {
                Divider()
                ScrollView {
                    HStack(alignment: .top, spacing: 0) {
                        
                        LazyVStack(spacing: 0) {
                            
                            ForEach(0..<moviePoster.count / 2) { index in
                                let randomPosterIndex = Int.random(in: 0...1)
                                //randomPosterIndex 가 1이면 그냥 포스터
                                if randomPosterIndex == 1 {
                                    
                                    MoviePoster(moviePoster: moviePoster[randomIndex[index]], posterWidth: posterWidth, posterHeight: CGFloat.random(in: posterWidth...300))
                                        .onTapGesture {
                                            withAnimation {
                                                print(randomIndex[index])
                                                isPresented.toggle()
                                            }
                                        }
                                        .fullScreenCover(isPresented: $isPresented) {
                                            MovieReview(movieInfo: moviePoster[randomIndex[index]])
                                        }
                                }
                                else {
                                    MovieQuoteInList(moviePoster: moviePoster[randomIndex[index]], posterWidth: posterWidth, posterHeight: CGFloat.random(in: posterWidth...300))
                                        .onTapGesture {
                                            withAnimation {
                                                isPresented.toggle()
                                            }
                                        }
                                        .fullScreenCover(isPresented: $isPresented) {
                                            
                                            MovieReview(movieInfo: moviePoster[randomIndex[index]])
                                        }
                                }
                                
                            }
                            .padding(.vertical, 10)
                            
                        }
                        
                        LazyVStack(spacing: 0) {
                            
                            ForEach(moviePoster.count / 2..<moviePoster.count) { index2 in
                                let randomPosterIndex = Int.random(in: 0...1)
                                
                                if randomPosterIndex == 0 {
                                    MoviePoster(moviePoster: moviePoster[randomIndex[index2]], posterWidth: posterWidth, posterHeight: CGFloat.random(in: posterWidth...300))
                                        .onTapGesture {
                                            withAnimation {
                                                print(randomIndex[index2])
                                                isPresented.toggle()
                                            }
                                        }
                                        .fullScreenCover(isPresented: $isPresented) {
                                            MovieReview(movieInfo: moviePoster[randomIndex[index2]])
                                        }
                                }
                                else {
                                    MovieQuoteInList(moviePoster: moviePoster[randomIndex[index2]], posterWidth: posterWidth, posterHeight: CGFloat.random(in: posterWidth...300))
                                        .onTapGesture {
                                            withAnimation {
                                                print(randomIndex[index2])
                                                isPresented.toggle()
                                            }
                                        }
                                        .fullScreenCover(isPresented: $isPresented) {
                                            MovieReview(movieInfo: moviePoster[randomIndex[index2]])
                                        }
                                }
                            }.padding(.vertical, 10)
                        }
                    }.padding(.horizontal, 10)
                }
            }
            .navigationBarItems(leading: Text("영화 리스트").fontWeight(.bold)
            .font(.system(size: 35)), trailing: MyMemoji())
            
        }
        
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList(moviePoster: movieInfo)
    }
}
