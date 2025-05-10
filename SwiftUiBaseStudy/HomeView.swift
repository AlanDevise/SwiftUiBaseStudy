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
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(sectionData) { item in
                        SectionView(section: item)
                    }
                }
                .padding(20)
                .padding(.bottom, 30)
            }
            Spacer()
        }
    }
}

#Preview {
    HomeView(showProfile: .constant(false))
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
    Section(
        title: "Prototype design in swift ui",
        text: "18 sections",
        logo: "Logo1",
        image: Image(uiImage: #imageLiteral(resourceName: "Card4")),
        color: Color(#colorLiteral(red: 0.4156862745, green: 0.3333333333, blue: 0.9882352941, alpha: 1))
    ),
    Section(
        title: "Build a swiftui app",
        text: "20 sections",
        logo: "Logo1",
        image: Image(uiImage: #imageLiteral(resourceName: "Card2")),
        color: Color(#colorLiteral(red: 0.07843137255, green: 0.7450980392, blue: 0.9921568627, alpha: 1))
    ),
    Section(
        title: "SwiftUI Advanced",
        text: "20 sections",
        logo: "Logo1",
        image: Image(uiImage: #imageLiteral(resourceName: "Card4")),
        color: Color(#colorLiteral(red: 0.968627451, green: 0.2156862745, blue: 0.3411764706, alpha: 1))
    )
]

struct SectionView: View {
    
    var section:Section
    
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
        .frame(width: 275, height: 275)
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .background(section.color)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}
