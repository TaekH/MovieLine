//
//  ContentView.swift
//  MyMovieQuotes
//
//  Created by 한택환 on 2022/04/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MovieQuote()
                .tabItem {
                    Image(systemName: "film")
                    Text("명대사")
                }
            MovieList()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("리스트")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
