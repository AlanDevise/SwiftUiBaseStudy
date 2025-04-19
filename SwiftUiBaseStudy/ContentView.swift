//
//  ContentView.swift
//  SwiftUiBaseStudy
//
//  Created by Alan Zhang on 2025/4/18.
//

import SwiftUI

struct ContentView: View {
    
    /// @State 表示是一个可相应式的响应变量
    @State var show: Bool = false // 定义动画是否执行
    
    var body: some View {
        ZStack {
            TitleView() // 注意这里.的顺序对于动画效果有影响
                .blur(radius: show ? 20 : 0)        // show为true时radius等于20否则等于0
                .animation(.default, value: show)   // 通过show这个变量来以default默认的动画进行展现效果
            BackCardView()
                .background(show ? Color("card3"):Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)     // 设置阴影圆角
                .offset(x: 0, y : show ? -400 : -40)   // 设置偏移位置
                .scaleEffect(0.9)       // 设置缩放大小
                .rotationEffect(.degrees(show ? 0 : 10))   // 设置二维平面顺时针旋转
                .rotation3DEffect(      // 设置3D旋转效果
                    .degrees(10),axis:(x: 10.0, y: 0.0,z: 0.0)
                )
                .blendMode(.hardLight)  // 添加穿透效果
                .animation(.easeInOut(duration: 0.5), value: show)
            BackCardView()
                .background(show ? Color("card4"):Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)     // 设置阴影圆角
                .offset(x: 0, y:show ? -200 : -20)   // 设置偏移位置
                .scaleEffect(0.9)       // 设置缩放大小
                .rotationEffect(.degrees(show ? 0 : 5))   // 设置二维平面顺时针旋转
                .rotation3DEffect(      // 设置3D旋转效果
                    .degrees(5),axis:(x: 10.0, y: 0.0, z: 0.0)
                )
                .blendMode(.hardLight)  // 设置混合模式，添加穿透效果
                .animation(.easeInOut(duration: 0.5), value: show)
            CardView()
                .blendMode(.hardLight)  // 设置混合模式，添加穿透效果
                .onTapGesture {         // 单击手势动作时
                    self.show.toggle()  // 反转变量show的状态（这里通常是Bool值）
                }
            BottomPopupView()
                .blur(radius: show ? 20 : 0)    // show为true时radius等于20否则等于0
                .animation(.default, value: show)   // 通过show这个变量来以default默认的动画进行展现效果
        }
    }
}

#Preview {
    ContentView()
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("UI design")
                        .font(.title)               // 设置字体格式
                        .fontWeight(.semibold)      // 设置字体粗细
                        .foregroundStyle(.white)    // 设置字体颜色
                    Text("Cetificate")
                        .foregroundStyle(Color("accent"))   // 设置前景样式
                }
                Spacer()
                Image("Logo1")
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 100, alignment: .top)
        }
        .frame(width: 340, height: 220)
        .background(Color.black)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

struct BackCardView: View {
    var body: some View {
        VStack{}
            .frame(width: 340, height: 220)
    }
}

struct TitleView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()                // 设置弹性空间
            }
            .padding()                  // 设置边距
            Image("Background1")
            Spacer()                    // 设置弹性空间
        }
    }
}

struct BottomPopupView: View {
    var body: some View {
        VStack(spacing:20){
            Rectangle()
                .frame(width: 40, height: 5)    // 设置外框规格
                .background(.black)             // 设置背景颜色
                .cornerRadius(30)               // 设置圆角弧度
                .opacity(0.1)                   // 设置透明度
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .font(.subheadline)                 // 设置字体
                .multilineTextAlignment(.center)    // 设置排列规则
                .lineSpacing(4)                     // 行间间隙
            Spacer()
        }
        .padding(.vertical, 8)          // 设置纵向间隔
        .padding(.horizontal, 20)       // 设置横向间隔
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(x: 0, y: 500)
    }
}
