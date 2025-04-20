//
//  Home.swift
//  SwiftUiBaseStudy
//
//  Created by Alan Zhang on 2025/4/20.
//

import SwiftUI

struct Home: View {
    
    /// 是否显示个人信息
    @State var showProfile: Bool = false
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red:0.8549019608,green:0.8745098039,blue:0.9176470588,alpha:1))
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 28))
                        .bold()
                    Spacer()
                    Button(action: {
                        showProfile.toggle()
                    }) {
                        Image("Avatar")
                            .resizable()
                        // 保证视图在缩放时，宽和高的比例维持不变
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                Spacer()
            }
            .padding(.top, 40)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: showProfile ? 30 : 0, style: .continuous))
            .scaleEffect(showProfile ? 0.9 : 1)
            .rotation3DEffect(
                Angle(degrees: showProfile ? -10 : 0), axis: (x: 10, y: 1, z: 0)
            )
            .offset(y: showProfile ? -450 : 0)
            .edgesIgnoringSafeArea(.all)
            
            MenuView()
                .offset(y: showProfile ? 0 : 600)
                .animation(.spring(response: 0.8, dampingFraction: 0.7),value: showProfile)
        }
        
    }
}

#Preview {
    Home()
}
