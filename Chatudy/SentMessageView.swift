//
//  MessageSentView.swift
//  ChatStudy
//
//  Created by 강창우 on 2023/03/19.
//

import SwiftUI

struct SentMessageView: View {
    @State var message: String
    @State var backgroundColor: Color
    @State var foregroundColor: Color
    
    var body: some View {
        Text(message)
            .padding()
            .font(.system(size: 12))
            .background(backgroundColor, in: RoundedRectangle(cornerRadius: 15))
            .foregroundColor(foregroundColor)
    }
}

struct MessageSentView_Previews: PreviewProvider {
    static var previews: some View {
        SentMessageView(message: "asdfafweffefwefwefwefsdf", backgroundColor: .gray, foregroundColor: .white)
    }
}
