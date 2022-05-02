//
//  MovieList.swift
//  MyMovieQuotes
//
//  Created by 한택환 on 2022/04/28.
//

import SwiftUI

struct MovieList: View {
    
    var moviePoster: [MovieInfo]
    //var movie: Int {moviePoster.count}
    let posterWidth = (UIScreen.main.bounds.width - 60) / 2
    //let randomIndex = Int.random(in: 0...9)
    var randomIndex = [0,1,2,3,4,5,6,7,8,9].shuffled()
    @State var selectedIndex = 0
    @State var isPresented = false
    //let randomIndex = [0,1,2,3,4,5,6,7,8,9]
    //let posters = [MoviePoster(moviePoster: movieInfo[0]), MovieQuoteInList(moviePoster: movieInfo[0])]
    var body: some View {
        NavigationView {
            VStack {
                Divider()
                ScrollView {
                    
                    
                    HStack(alignment: .top, spacing: 0) {
                        
                        LazyVStack(spacing: 0) {
                            
                            ForEach(0..<moviePoster.count / 2) {index in
                                let randomPosterIndex = Int.random(in: 0...1)
                                //randomPosterIndex 가 1이면 그냥 포스터
                                if randomPosterIndex == 1 {
                                    
                                    MoviePoster(moviePoster: moviePoster[randomIndex[index]], posterWidth: posterWidth, posterHeight: CGFloat.random(in: posterWidth...300))
                                        .onTapGesture {
                                            withAnimation {
                                                selectedIndex = index
                                                self.isPresented.toggle()
                                            }
                                        }
                                        
                                }
                                else {
                                    MovieQuoteInList(moviePoster: moviePoster[randomIndex[index]], posterWidth: posterWidth, posterHeight: CGFloat.random(in: posterWidth...300))
                                        .onTapGesture {
                                            selectedIndex = index
                                            withAnimation {
                                                self.isPresented.toggle()
                                            }
                                        }
                                }
                                
                            }
                            .padding(.vertical, 10)
                            
                        }
                        
                        LazyVStack(spacing: 0) {
                            ForEach(moviePoster.count / 2..<moviePoster.count) {index in
                                let randomPosterIndex = Int.random(in: 0...1)
                                
                                if randomPosterIndex == 0 {
                                    MoviePoster(moviePoster: moviePoster[randomIndex[index]], posterWidth: posterWidth, posterHeight: CGFloat.random(in: posterWidth...300))
                                        .onTapGesture {
                                            selectedIndex = index
                                            withAnimation {
                                                self.isPresented.toggle()
                                            }
                                        }
                                }
                                else {
                                    MovieQuoteInList(moviePoster: moviePoster[randomIndex[index]], posterWidth: posterWidth, posterHeight: CGFloat.random(in: posterWidth...300))
                                        .onTapGesture {
                                            selectedIndex = index
                                            withAnimation {
                                                self.isPresented.toggle()
                                            }
                                        }
                                }
                            }.padding(.vertical, 10)
                        }
                    }.padding(.horizontal, 10)
                }
            }
            .navigationBarItems(leading: Text("영화 리스트").fontWeight(.bold)
            .font(.system(size: 35)), trailing: MyMemoji())
            .sheet(isPresented: $isPresented) {
                MovieReview(movieInfo: movieInfo[randomIndex[selectedIndex]], isPresented: $isPresented)
            }
            
        }
        
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList(moviePoster: movieInfo)
    }
}
