//
//  UpdateList.swift
//  SwiftUiBaseStudy
//
//  Created by Alan Zhang on 2025/5/10.
//

import SwiftUI

struct UpdateList: View {
    var body: some View {
        NavigationView {
            List(updateData) { update in
                NavigationLink(destination: UpdateDetail(update: update)) {
                    HStack {
                        Image(update.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .background(Color("primary"))
                            .clipShape(
                                RoundedRectangle(
                                    cornerRadius: 20,
                                    style: .circular
                                )
                            )
                            .padding(.trailing, 4)
                        VStack(alignment: .leading, spacing: 4.0) {
                            Text(update.title)
                                .font(.system(size: 20, weight: .bold))
                            Text(update.text)
                                .font(.subheadline)
                                .lineLimit(2)
                                .foregroundStyle(.secondary)
                            Text(.init(update.date))
                                .font(.caption)
                                .foregroundStyle(Color("secondary"))
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("UpdateList")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

/// 更新对象数据结构
struct Update: Identifiable {
    var id: UUID = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(
        image: "Card1",
        title: "SwiftUI Advanced",
        text:
            "Take your SwiftUI app to the App Stroe with advanced techniques like API data, packages and CMS.",
        date: "2021-01-01"
    ),
    Update(
        image: "Card2",
        title: "Webflow",
        text:
            "Design and animate a high converting landing page with advanced interactions, payments and CMS",
        date: "2021-01-02"
    ),
    Update(image: "Card3", title: "ProtoPie", text: "内容3", date: "2021-01-03"),
    Update(image: "Card4", title: "SwiftUI", text: "内容4", date: "2021-01-04"),
    Update(
        image: "Card5",
        title: "Framer Playground",
        text: "内容5",
        date: "2021-01-05"
    ),
]

#Preview {
    UpdateList()
}
