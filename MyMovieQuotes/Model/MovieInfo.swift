//
//  MovieInfo.swift
//  MyMovieQuotes
//
//  Created by 한택환 on 2022/04/28.
//

import Foundation
import SwiftUI

struct MovieInfo: Hashable, Codable, Identifiable {
    
    var title: String
    var cast: String
    var director: String
    var quote: String
    private var posterName: String//이미지 이름을 읽어올 imageName 속성
    var poster: Image {
        Image(posterName)
    }
    
    var trailer: String
    var starrating: Double
    var release: Int
    var id: Int
    
}


/*
 {
     "title": "begin again",
     "cast": "마크 러팔로, 키이라 나이틀리, 헤일리 스테인펠트"
     "director": "존 카니"
     "quote": "이래서 음악이 좋아\n모든 평범함도 음악을 듣는 순간\n빛나는 진주처럼 변하니까."
     "poster": "beginagainposter"
     "trailer":" "
     "starrating": 5
     "release": 2014
     "id": 1
 },
 */
