//
//  HomeView.swift
//  SwiftUiBaseStudy
//
//  Created by Alan Zhang on 2025/4/20.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showProfile: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28))
                    .bold()
                Spacer()
                AvatarView(showProfile: $showProfile)
            }
            .padding(.horizontal)
            Spacer()
        }
    }
}

#Preview {
    HomeView(showProfile: .constant(false))
}
