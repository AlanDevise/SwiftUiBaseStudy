//
//  TabBar.swift
//  SwiftUiBaseStudy
//
//  Created by Alan Zhang on 2025/5/17.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            Home()
                .tabItem {
                    Image(systemName: "play.circle.fill")
                    Text("Home")
                }
            ContentView().tabItem {
                Image(systemName: "rectangle.stack.fill")
                Text("Certificates")
            }
        }
        .tabViewStyle(DefaultTabViewStyle())
    }
}

#Preview {
    TabBar()
}
