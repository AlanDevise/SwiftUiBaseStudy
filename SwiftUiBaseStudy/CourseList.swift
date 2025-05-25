//
//  CourseList.swift
//  SwiftUiBaseStudy
//
//  Created by Alan Zhang on 2025/5/25.
//

import SwiftUI

struct CourseList: View {
    var body: some View {
        VStack {
            CourseView()
        }
    }
}

#Preview {
    CourseList()
}

struct CourseView: View {
    
    @State var show = false
    
    var body: some View {
        VStack {
            HStack {
                VStack{
                    Text("Swift UI Advance")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.white)
                    Text("20 sections")
                        .foregroundStyle(.white.opacity(0.7))
                }
                Spacer()
                Image("Logo1")
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
        .frame(width:show ? .infinity : screen.width - 60, height:show ? .infinity : 240)
        .background(Color(#colorLiteral(red:0.3647058904,green:0.06666667014,blue:0.9686274529,alpha:1)))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(color: Color(#colorLiteral(red:0.3647058904,green:0.06666667014,blue:0.9686274529, alpha:1)).opacity(0.3), radius: 20, x: 0, y: 20)
        .ignoresSafeArea(.all)
        .animation(.spring(response: 0.5, dampingFraction: 0.9),value: show)
        .onTapGesture {
            show.toggle()
        }
    }
}
