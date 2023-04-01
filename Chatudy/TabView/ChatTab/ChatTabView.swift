//
//  ChatTabView.swift
//  ChatStudy
//
//  Created by 강창우 on 2023/03/19.
//

import SwiftUI

struct ChatTabView: View {
    @State private var message = ""
    @State private var selection = 1
    var body: some View {
        VStack {
            
            Picker("Settings", selection: $selection) {
                        Text("알고리즘").tag(1)
                        Text("Swift").tag(2)
                        Text("자료구조").tag(3)
            }
            .pickerStyle(MenuPickerStyle())
            QAView()
            Spacer()
            HStack {
                TextField("Enter message", text: $message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: sendMessage) {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.largeTitle)
                }
            }
            .padding()
        }
    }
    func sendMessage() {
        // Handle sending the message here
    }
}

struct ChatTabView_Previews: PreviewProvider {
    static var previews: some View {
        ChatTabView()
    }
}
