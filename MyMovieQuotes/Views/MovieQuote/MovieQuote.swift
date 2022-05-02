//
//  MovieQuote.swift
//  MyMovieQuotes
//
//  Created by 한택환 on 2022/04/28.
//

import SwiftUI

struct MovieQuote: View {
    let posterWidth = UIScreen.main.bounds.width / 2.85
    let posterHeight = UIScreen.main.bounds.height / 4.13
    @State var currentIndex: Int = 0
    @State var isPresented = false
    
    //MARK: 현재시각
    var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }
    @State var currentDate = Date()
    
    var body: some View {
        //let randomIndex = [0,1,2,3,4,5,6,7,8,9].shuffled()
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                MovieQuotePoste(movieInfo: movieInfo[currentIndex], isPresented: $isPresented)
                    
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
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 13))
                Text("영화")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 35))
            }, trailing: MyMemoji())
            .sheet(isPresented: $isPresented) {
                MovieReview(movieInfo: movieInfo[currentIndex], isPresented: $isPresented)
            }
        }
    }
}

struct MovieQuote_Previews: PreviewProvider {
    static var previews: some View {
        MovieQuote()
    }
}
