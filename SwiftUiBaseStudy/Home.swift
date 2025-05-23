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
    
    @State var viewState: CGSize = CGSize.zero
    
    @State var showContent = false
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red:0.8549019608,green:0.8745098039,blue:0.9176470588,alpha:1))
                .edgesIgnoringSafeArea(.all)
            HomeView(showProfile: $showProfile, showContent: $showContent)
                .padding(.top, 60)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: showProfile ? 30 : 0, style: .continuous))
                .scaleEffect(showProfile ? 0.9 : 1)
                .rotation3DEffect(
                    Angle(degrees: showProfile ? Double(viewState.height / -10)-10 : 0), axis: (x: 10, y: 1, z: 0)
                )
                .offset(y: showProfile ? -450 : 0)
                .animation(.spring(response: 0.8, dampingFraction: 0.7),value: showProfile)
                .edgesIgnoringSafeArea(.all)
            
            MenuView()
                .background(.black.opacity(0.001))
                .offset(y: showProfile ? 0 : screen.height)
                .offset(y: viewState.height)
                .animation(.spring(response: 0.8, dampingFraction: 0.7),value: showProfile)
                .onTapGesture {
                    showProfile.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged( { value in
                            withAnimation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8)) {
                                viewState = value.translation
                                if viewState.height < -200 {
                                    viewState.height = -200
                                }
                            }
                        })
                        .onEnded( { value in
                            withAnimation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8)) {
                                if viewState.height > 50 {
                                    showProfile.toggle()
                                }
                                viewState = .zero
                            }
                        })
                )
            if showContent{
                Color.white.ignoresSafeArea(.all)
                ContentView()
                VStack{
                    HStack{
                        Spacer()
                        Image(systemName: "xmark")
                            .frame(width: 36, height: 36)
                            .foregroundStyle(.white)
                            .background(.black)
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                .padding(.trailing,16)
                .padding(.top,16)
                .transition(.move(edge: .top))
                .onTapGesture {
                    showContent = false
                }
            }
        }
    }
}

#Preview {
    Home()
}

struct AvatarView: View {
    
    @Binding var showProfile: Bool
    
    var body: some View {
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
}
