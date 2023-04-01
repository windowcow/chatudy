//
//  ConversationView.swift
//  ChatStudy
//
//  Created by 강창우 on 2023/03/19.
//

import SwiftUI

struct Message: Hashable {
    let text: String
    let isFromCurrentUser: Bool
}

struct ChatBubble: Shape {
    var isCurrentUser: Bool

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, isCurrentUser ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 20, height: 20))

        if isCurrentUser {
            path.move(to: CGPoint(x: rect.maxX - 5, y: rect.maxY - 20))
            path.addLine(to: CGPoint(x: rect.maxX + 10, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX - 15, y: rect.maxY - 20))
        } else {
            path.move(to:CGPoint(x :rect.minX + 5,y :rect.maxY - 20))
            path.addLine(to:CGPoint(x :rect.minX - 10,y :rect.maxY))
            path.addLine(to:CGPoint(x :rect.minX + 15,y :rect.maxY - 20))
        }

        return Path(path.cgPath)
    }
}

struct ConversationView: View {
    @State private var messages: [Message] = [
        Message(text: "Hello!", isFromCurrentUser: false),
        Message(text: "Hi there!", isFromCurrentUser: true),
        Message(text: "How can I help you?", isFromCurrentUser: false)
    ]
    @State private var newMessageText = ""

    var body: some View {
        VStack {
            ScrollView {
                ForEach(messages, id: \.self) { message in
                    HStack {
                        if !message.isFromCurrentUser {
                            ChatBubble(isCurrentUser:false)
                                .fill(Color.gray.opacity(0.2))
                                .frame(width:CGRectGetWidth(UIScreen.main.bounds) / 2,height:CGRectGetHeight(UIScreen.main.bounds) / 6)
                                .overlay(
                                    Text(message.text)
                                        .foregroundColor(.black)
                                        .padding(10),alignment:.topLeading
                                )
                            Spacer()
                        } else {
                            Spacer()
                            ChatBubble(isCurrentUser:true)
                                .fill(Color.blue.opacity(0.8))
                                .frame(width:CGRectGetWidth(UIScreen.main.bounds) / 2,height:CGRectGetHeight(UIScreen.main.bounds) / 6)
                                .overlay(
                                    Text(message.text)
                                        .foregroundColor(.white)
                                        .padding(10),alignment:.topTrailing
                                )
                        }
                    }
                }
            }
        }
    }

    func sendMessage() {
        messages.append(Message(text:newMessageText,isFromCurrentUser:true))
        newMessageText = ""
        
        // Handle sending the message to the chatbot and receiving a response here
    }
}
struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
