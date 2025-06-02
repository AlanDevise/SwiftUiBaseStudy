//
//  CourseList.swift
//  SwiftUiBaseStudy
//
//  Created by Alan Zhang on 2025/5/25.
//

import SwiftUI

struct CourseList: View {
    
    @State var show = false
    @State var show2 = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30.0) {
                CourseView(show:$show)
                GeometryReader { geometry in
                    CourseView(show:$show2)
                        .offset(y:show2 ? -geometry.frame(in: .global).minY:0)
                }
                .frame(height: show2 ? screen.height:280)
                .frame(maxWidth: show2 ? .infinity : screen.width - 60)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    CourseList()
}

struct CourseView: View {
    
    @Binding var show : Bool
    
    var body: some View {
        ZStack(alignment: .top) {
            // content
            VStack(alignment: .leading, spacing: 30.0) {
                Text("Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.")
                Text("About this course")
                    .font(.title).bold()
                Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for ios and macos. while it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance.It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
                Text("Minimal coding experience required, such as in HTML and css. Please note that  Xcode 11 and Catalina are essential. Once you get everything installed, it'11 get a lot friendlier! I added a bunch of troubleshoots at the end of this page to help you navigate the issues you might encounter.")
            }
            .padding(30)
            .frame(maxWidth: show ? .infinity : screen.width - 60)
            .frame(maxHeight: show ? screen.height : 280, alignment: .top)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .shadow(color:.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: show ? 460 : 0)
            .opacity(show ? 1 : 0)
            
            // Card
            VStack {
                HStack {
                    VStack(alignment:.leading, spacing: 8.0){
                        Text("Swift UI Advance")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(.white)
                        Text("20 sections")
                            .foregroundStyle(.white.opacity(0.7))
                    }
                    Spacer()
                    ZStack {
                        Image("Logo1")
                            .opacity(show ? 0 : 1)
                        Image(systemName: "xmark")
                            .font(.system(size: 26,weight: .medium))
                            .foregroundStyle(.white)
                            .frame(width: 36, height: 36)
                            .background(.black)
                            .clipShape(Circle())
                            .opacity(show ? 1 : 0)
                            .onTapGesture {
                                show = false
                            }
                    }
                }
                Spacer()
                Image("Card3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 140, alignment: .top)
            }
            .padding(20)
            .padding(.top,show ? 30 : 0)
            // .frame(width:show ? screen.width : screen.width - 60, height:show ? screen.height : 240)
            .frame(maxWidth:show ? .infinity : screen.width - 60, maxHeight:show ? 460 : 280)
            .background(Color(#colorLiteral(red:0.3647058904,green:0.06666667014,blue:0.9686274529,alpha:1)))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .shadow(color: Color(#colorLiteral(red:0.3647058904,green:0.06666667014,blue:0.9686274529, alpha:1)).opacity(0.3), radius: 20, x: 0, y: 20)
            
            .onTapGesture {
                if !show{
                    show = true
                }
            }
        }
        .ignoresSafeArea(.all)
        .animation(.spring(response: 0.5, dampingFraction: 0.6), value: show)
    }
}
