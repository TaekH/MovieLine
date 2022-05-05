//
//  WritingQuote.swift
//  MyMovieQuotes
//
//  Created by 한택환 on 2022/05/05.
//

import SwiftUI

struct WritingQuote: View {
    
    @State var quote: String = ""
    @Binding var quoteArray: MovieInfo2
    @Environment(\.presentationMode) var presentationMode
    func saveQuote() {
        if quoteAppropriate() {
            quoteArray.quote.append(quote)
            quote = ""
            presentationMode.wrappedValue.dismiss()
        }
    }
    @State var showAlert = false
    @State var alertTitle = ""
    
    func quoteAppropriate() -> Bool {
        if quote.count < 5 {
            alertTitle = "다섯글자 이상 입력해주세요."
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func quoteAlert() -> Alert {
        Alert(title: Text(alertTitle))
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                Divider()
                
                TextEditor(text: $quote)
                    .padding(15)
                Spacer()
            }
            .alert(isPresented: $showAlert, content: quoteAlert)
            .navigationTitle("당신의 명대사")
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("취소")
            }, trailing: Button(action: { saveQuote() }) {
                Text("저장")
            }).font(.system(size: 20))
                .foregroundColor(Color("customBlueColor"))
            
        }
    }
}

//struct WritingQuote_Previews: PreviewProvider {
//    static var previews: some View {
//        WritingQuote(quoteArray: $dummyMovie[0])
//    }
//}
