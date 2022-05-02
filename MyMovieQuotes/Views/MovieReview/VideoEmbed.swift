//
//  VideoEmbed.swift
//  MyMovieQuotes
//
//  Created by 한택환 on 2022/05/02.
//

import SwiftUI
import WebKit

struct VideoEmbed: UIViewRepresentable {
    
    var movieTrailer: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeLink = URL(string: "https://www.youtube.com/embed/\(movieTrailer)") else {return}
        //uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeLink))
    }
    
}
