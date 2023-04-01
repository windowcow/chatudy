//
//  MessageRecievedView.swift
//  ChatStudy
//
//  Created by 강창우 on 2023/03/19.
//

import SwiftUI

struct ReviecedMessageView: View {
    @State var message: String
    @State var backgroundColor: Color
    @State var foregroundColor: Color
    
    var body: some View {
        Text(message)
            .padding()
            .font(.system(size: 12))
            .background(Color.blue, in: RoundedRectangle(cornerRadius: 15))
            .foregroundColor(foregroundColor)
    }
    
    struct MessageRecievedView_Previews: PreviewProvider {
        static var previews: some View {
            ReviecedMessageView(message: """
나는 어린 시절부터 책을 읽는 것을 좋아했다. 책을 읽으면서 나는 다양한 세계를 경험하고 새로운 지식을 얻었다. 그러나 나의 가장 좋아하는 책은 어린이 문학작가 이광수의 '소나기'였다.

'소나기'는 한 소년이 무더운 여름날 갑자기 내리는 소나기를 보며 느끼는 감정들을 그린 작품이다. 이 작품에서 나는 소년의 순수한 마음과 자연의 아름다움에 감동받았다.

그 후로 나는 이광수의 다른 작품들도 찾아 읽었다. 그 중에서도 '산골소년'과 '봄'은 나에게 큰 감동을 주었다. 이광수의 작품들은 항상 나를 따뜻하게 안아주고 위로해주었다.

지금도 나는 책을 읽는 것을 좋아한다. 책 속 세계에서 나는 여전히 새로운 지식과 감동을 얻고 있다.
""", backgroundColor: .blue, foregroundColor: .white)
        }
    }
}
