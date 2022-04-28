//
//  MyMemoji.swift
//  MyMovieQuotes
//
//  Created by 한택환 on 2022/04/28.
//

import SwiftUI

struct MyMemoji: View {
    var image = Image("myMemoji")
    
    var body: some View {
        image
            .background(Color("dividerColor"))
            .clipShape(Circle())
            
    }
}

struct MyMemoji_Previews: PreviewProvider {
    static var previews: some View {
        MyMemoji()
    }
}
