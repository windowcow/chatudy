//
//  ContentView.swift
//  Chatudy
//
//  Created by 강창우 on 2023/04/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ResourceTabView()
                .tabItem {
                    Image(systemName: "book")
                    Text("resource")
                }
            
            StatisticsTabView()
                .tabItem {
                    Image(systemName: "chart.bar.xaxis")
                    Text("statistics")
                }
            
            ChatTabView()
                .tabItem {
                    Image(systemName: "bubble.left.and.bubble.right")
                    Text("chat")
                }
            
            CustomTabView()
                .tabItem {
                    Image(systemName: "plus.bubble")
                    Text("custom")
                }
            
            SettingsTabView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
