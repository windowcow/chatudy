//
//  SettingsTabView.swift
//  ChatStudy
//
//  Created by 강창우 on 2023/03/19.
//

import SwiftUI

struct SettingsTabView: View {
    @Environment(\.presentationMode) private var presentationMode

        var body: some View {
            VStack {
                Text("도형 만들기")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                HStack {
                    Text("둥근 모양")
                    Spacer()
                }
                ZStack {
                    Rectangle()
                        .frame(width: 300, height: 10)
                    HStack {
                        Circle().fill(Color.yellow)
                        Ellipse().fill(Color.green)
                        Capsule().fill(Color.orange)
                        RoundedRectangle(cornerRadius: 30).fill(Color.gray)
                    }
                }
            }
        }
}

struct SettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTabView()
    }
}
