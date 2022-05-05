//
//  ContentView.swift
//  MyMovieQuotes
//
//  Created by 한택환 on 2022/04/28.
//

import SwiftUI

struct ContentView: View {
    //탭바 구분선 추가 (ios 15부터 디폴트로 구분선 삭제)
    @State private var selection = 0
    init() {
        UITabBar.appearance().scrollEdgeAppearance = .init()
    }
    
    var body: some View {
        TabView(selection: $selection) {
            MovieQuote()
                .tabItem {
                    Image(systemName: "film")
                    Text("명대사")
                }
                .tag(0)
            MovieList(moviePoster: dummyMovie)
                .tabItem {
                    Image(systemName: "list.and.film")
                    Text("리스트")
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
