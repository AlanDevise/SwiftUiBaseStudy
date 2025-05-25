//
//  HomeView.swift
//  SwiftUiBaseStudy
//
//  Created by Alan Zhang on 2025/4/20.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showProfile: Bool
    
    /// 是否显示提示框
    @State var showUpdate: Bool = false
    
    @Binding var showContent: Bool
    
    var body: some View {
        ScrollView (showsIndicators: false) {
            VStack {
                HStack {
                    Text("Watching")
                    //                    .font(.system(size: 28))
                    //                    .bold()
                        .modifier(CustomFontModifier())
                    Spacer()
                    AvatarView(showProfile: $showProfile)
                    
                    Button{
                        showUpdate.toggle()
                    }label: {
                        Image(systemName: "bell")
                            .renderingMode(.original)
                            .font(.system(size: 16, weight: .medium))
                            .frame(width: 36, height: 36)
                            .background(.white)
                            .clipShape(Circle())
                            .shadow(color:Color("primary").opacity(0.1),radius:1,x:0,y:1)
                            .shadow(color:Color("primary").opacity(0.2),radius:10,x:0,y:10)
                    }
                    .sheet(isPresented: $showUpdate) {
                        UpdateList()
                    }
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    WatchingRingView()
                        .padding(.horizontal, 30)
                        .padding(.bottom, 30)
                        .onTapGesture{
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)){
                                showContent = true
                            }
                        }
                }
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(sectionData) { item in
                            GeometryReader{ geometry in
                                SectionView(section: item)
                                    .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x:0, y:1, z:0))
                            }
                            .frame(width: 275, height: 275)
                        }
                    }
                    .padding(20)
                    .padding(.bottom, 30)
                }
                
                HStack{
                    Text("Courses")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .padding(.leading, 16)
                .offset(y: -30)
                
                SectionView(section: sectionData[2], width: screen.width-60)
                
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView(showProfile: .constant(false), showContent: .constant(false))
}

// model
struct Section: Identifiable {
    var id: UUID = UUID()
    var title: String
    var text:String
    var logo:String
    var image:Image
    var color:Color
}

// 数据
var sectionData = [
    Section(title: "Prototype design in swift ui", text: "18 sections",logo: "Logo1",image: Image(uiImage: #imageLiteral(resourceName: "Card4")),color: Color(#colorLiteral(red: 0.4156862745, green: 0.3333333333, blue: 0.9882352941, alpha: 1))),
    Section(title: "Build a swiftui app",text: "20 sections",logo: "Logo1",image: Image(uiImage: #imageLiteral(resourceName: "Card2")),color: Color(#colorLiteral(red: 0.07843137255, green: 0.7450980392, blue: 0.9921568627, alpha: 1))),
    Section(title: "SwiftUI Advanced",text: "20 sections",logo: "Logo1",image: Image(uiImage: #imageLiteral(resourceName: "Card4")),color: Color(#colorLiteral(red: 0.968627451, green: 0.2156862745, blue: 0.3411764706, alpha: 1)))
]

struct SectionView: View {
    
    var section:Section
    
    var width:CGFloat = 275
    var height:CGFloat = 275
    
    var body: some View {
        VStack {
            HStack {
                Text(section.title)
                    .foregroundStyle(.white)
                    .font(.system(size: 24))
                    .bold(true)
                    .lineLimit(3)  // 限制行数
                    .frame(
                        width: 160,
                        alignment: .leading
                    )
                Spacer()
                Image(section.logo)
            }
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .frame(width: width, height: height)
        .background(section.color)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct WatchingRingView: View {
    var body: some View {
        HStack(spacing: 30.0) {
            HStack(spacing: 20.0) {
                RingView(color1: #colorLiteral(red:0.3647058904,green:0.06666667014,blue:0.9686274529,alpha:1), color2: #colorLiteral(red:0.2588235438,green:0.7568627596,blue:0.9686274529,alpha:1), width: 44, height: 44, show: .constant(true))
                //                    .animation(.easeInOut.delay(0.25), value: show)
                VStack(alignment: .leading, spacing: 8.0){
                    Text("6 minutes left")
                    //                        .font(.subheadline)
                        .modifier(FontModifier(style: .subheadline))
                        .bold()
                    Text("10 min study today")
                    //                        .font(.caption)
                        .modifier(FontModifier(style: .caption))
                        .foregroundStyle(.gray)
                }
                
            }
            .padding(8)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            //            .shadow(color:.black.opacity(0.2), radius: 20,x:0,y:10)
            //            .shadow(color:.black.opacity(0.1), radius: 1,x:0,y:1)
            .modifier(ShadowModifier())
            HStack{
                RingView(color1:#colorLiteral(red:0.8078431487,green:0.02745098062,blue:0.3333333433,alpha: 1),color2:#colorLiteral(red:0.8549019694, green:0.250980407,blue:0.4784313738, alpha:1),width: 44, height:44, percent: 54,show:.constant(true))
                    .padding(8)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .modifier(ShadowModifier())
                RingView(color1:#colorLiteral(red:0.2588235438,green:0.7568627596,blue:0.9686274529,alpha:1),color2:#colorLiteral(red:0.9411764741,green:0.4980392158,blue:0.3529411852,alpha:1),width: 44, height:44, percent: 54,show:.constant(true))
                    .padding(8)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .modifier(ShadowModifier())
                
            }
        }
    }
}
