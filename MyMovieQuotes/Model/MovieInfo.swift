//
//  MovieInfo.swift
//  MyMovieQuotes
//
//  Created by 한택환 on 2022/04/28.
//

import Foundation
import SwiftUI

struct MovieInfo: Codable, Hashable, Identifiable {
    
    var title: String
    var cast: String
    var director: String
    var quote: [String]
    var posterName: String//이미지 이름을 읽어올 imageName 속성
    var trailer: String
    var starrating: Double
    var release: Int
    var id: Int
    
}
