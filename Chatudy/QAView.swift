//
//  QAView.swift
//  ChatStudy
//
//  Created by 강창우 on 2023/03/19.
//

import SwiftUI

struct QAView: View {
    @State private var question: String = ""
    @State private var answer: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                SentMessageView(message: "asdfasdf", backgroundColor: .gray, foregroundColor: .white)
                    .frame(maxWidth: geometry.size.width * 7 / 8, alignment: .trailing)
                ReviecedMessageView(message: "asdfasdf", backgroundColor: .blue, foregroundColor: .white)
                    .frame(maxWidth: geometry.size.width * 7 / 8, alignment: .leading)
            }
            .frame(width: geometry.size.width)
        }
        
    }
}

struct QAView_Previews: PreviewProvider {
    static var previews: some View {
        QAView()
    }
}
