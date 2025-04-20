//
//  MenuView.swift
//  SwiftUiBaseStudy
//
//  Created by Alan Zhang on 2025/4/20.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing:16) {
                Text("Swift ui study 24%")
                    .font(.caption)
                // 本质上可以用frame不停地套娃下去
                Color.white
                    .frame(width: 30, height: 6)
                    .cornerRadius(3)
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.08)))
                    .cornerRadius(3)
                    .frame(width: 150,height: 24)
                    .background(Color(#colorLiteral(red:0.7882352941,green:0.8196078431,blue:0.862745098,alpha:1)))
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20)
                MenuRow(title: "Account", icon: "gear")
                MenuRow(title: "Billing", icon: "creditcard")
                MenuRow(title: "Sign Out", icon: "person.crop.circle")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),Color(#colorLiteral(red: 0.7952535152, green: 0.7952535152, blue: 0.7952535152, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            // 依据指定的形状对视图的可见区域加以裁剪。此操作会让视图仅在指定形状的范围内可见，超出部分则会被隐藏。
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(radius: 30)
            .padding(.horizontal, 30)
            // 在某个视图的上方添加另一个视图，并且两个视图会对齐显示
            .overlay{
                Image("Avatar")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .offset(x: 0, y: -150)
            }
        }
        .padding(.bottom, 30)
    }
}

#Preview {
    MenuView()
}


struct MenuRow:View {
    var title:String = ""
    var icon:String = ""
    var body: some View {
        HStack(spacing:16){
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: 16, height: 16)
                .foregroundStyle(Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1)))
            Text(title)
                .font(.system(size: 20, weight: .bold))
                .frame(width: 120, alignment: .leading)
        }
    }
}
