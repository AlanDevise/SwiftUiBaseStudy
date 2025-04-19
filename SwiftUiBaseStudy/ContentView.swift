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
    
    /// A property wrapper type that can read and write a value managed by SwiftUI.
    @State var viewState: CGSize = CGSize.zero
    
    @State var showCard: Bool = false;
    
    /// 是否近似全屏展示
    @State var showFull: Bool = false;
    
    /// 底部拖拽状态
    @State var bottomState: CGSize = CGSize.zero;
    
    var body: some View {
        ZStack {
            TitleView()                             // 注意这里.的顺序对于动画效果有影响
                .offset(y: showCard ? -200 : 0)
                .opacity(showCard ? 0.2 : 1)
                .blur(radius: show ? 20 : 0)        // show为true时radius等于20否则等于0
                .animation(Animation.default.delay(0.2), value: show || showCard)   // 通过show这个变量来以default默认的动画进行展现效果
            
            Text("width: \(viewState.width), height: \(viewState.height)")
                .offset(x: 0, y: -310)
            
            BackCardView()
                .frame(width: showCard ? 300 : 340, height: 220)
                .background(show ? Color("card3"):Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)                                 // 设置阴影圆角
                .offset(x: 0, y : show ? -400 : -40)                // 设置偏移位置
                .offset(x:viewState.width, y: viewState.height)     // 动态设置偏移量
                .offset(y: showCard ? -180 : 0)
                .scaleEffect(showCard ? 1 : 0.9)                                   // 设置缩放大小
                .rotationEffect(.degrees(show ? 0 : 10))            // 设置二维平面顺时针旋转
                .rotationEffect(.degrees(showCard ? -10 : 0))
                .rotation3DEffect(                                  // 设置3D旋转效果
                    .degrees(showCard ? 0 : 10),axis:(x: 10.0, y: 0.0,z: 0.0)
                )
                .blendMode(.hardLight)                              // 添加穿透效果
                .animation(.easeInOut(duration: 0.5), value: show)
            BackCardView()
                .frame(width: 340, height: 220)
                .background(show ? Color("card4"):Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)                                 // 设置阴影圆角
                .offset(x: 0, y:show ? -200 : -20)                  // 设置偏移位置
                .offset(x:viewState.width, y: viewState.height)     // 动态设置偏移量
                .offset(y: showCard ? -140 : 0)
                .scaleEffect(showCard ? 1 : 0.95)                                   // 设置缩放大小
                .rotationEffect(.degrees(show ? 0 : 5))             // 设置二维平面顺时针旋转
                .rotationEffect(.degrees(showCard ? -5 : 0))             // 设置二维平面顺时针旋转
                .rotation3DEffect(      // 设置3D旋转效果
                    .degrees(showCard ? 0 : 5), axis:(x: 10.0, y: 0.0, z: 0.0)
                )
                .blendMode(.hardLight)                              // 设置混合模式，添加穿透效果
                .animation(.easeInOut(duration: 0.5), value: show)
            CardView()
                .frame(width: showCard ? 375 : 340, height: 220)
                .background(Color.black)
                .cornerRadius(showCard ? 30 : 20)
                .shadow(radius: 20)
                .offset(x:viewState.width, y: viewState.height)     // 动态设置偏移量
                .offset(y: showCard ? -100 : 0)
                .blendMode(.hardLight)                              // 设置混合模式，添加穿透效果
                .onTapGesture {                                     // 单击手势动作时
                    self.showCard.toggle()                          // 反转变量showCard的状态（这里通常是Bool值）
                }
                .gesture(                                           // 定义一个手势动作
                    DragGesture()                                   // 拖拽动作
                        .onChanged({value in
                            viewState = value.translation
                            show = true
                        })
                        .onEnded { value in
                            viewState = CGSize.zero
                            show = false
                        }
                )
            // response：手指移动之后的响应速度，dampingFraction：跟随手指的晃动程度
                .animation(.spring(response: 0.3, dampingFraction: 0.6),value: viewState)
            
            BottomPopupView()
                .offset(x: 0, y: showCard ? 360 : 1000)
                .offset(y: bottomState.height)
                .blur(radius: show ? 20 : 0)        // show为true时radius等于20否则等于0
                .animation(
                    .timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8),
                    value: show || showCard
                )   // 通过show这个变量来以default默认的动画进行展现效果
                .gesture(
                    DragGesture()
                        .onChanged({value in
                            bottomState = value.translation
                            if (showFull){
                                bottomState.height += -300
                            }
                            if bottomState.height < -300 {
                                bottomState.height = -300
                            }
                        })
                        .onEnded { value in
                            if bottomState.height > 50 {
                                showCard = false
                            }
                            // 节点控制
                            if (!showFull && bottomState.height < -100)
                                || (showFull && bottomState.height < -250){
                                showFull = true
                                bottomState.height = -300
                            }else{
                                bottomState = CGSize.zero
                                showFull = false
                            }
                        }
                )
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
    }
}

struct BackCardView: View {
    var body: some View {
        VStack{}
    }
}

/// 标题视图
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

/// 底部弹窗视图
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
    }
}
