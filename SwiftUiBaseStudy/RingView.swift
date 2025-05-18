//
//  RingView.swift
//  SwiftUiBaseStudy
//
//  Created by Alan Zhang on 2025/5/18.
//

import SwiftUI

struct RingView: View {
    var body: some View {
        ZStack {
            // 背景轨迹
            Circle()
                .stroke(
                    .black.opacity(0.1),
                    style: StrokeStyle(lineWidth: 4,lineCap: .round)
                )
                .frame(width: 44, height: 44)
            // 这个进度条通过外圈圆进行2D旋转90度，再3D以X轴旋转180度实现，
            // 通过控制trim中from参数的值可以控制从12点方向逆时针的空缺大小
            Circle()
                .trim(from: 0.3, to: 1)
                .stroke(
                    LinearGradient(gradient:Gradient(colors:[Color(#colorLiteral(red:0.2588235438,green:0.7568627596,blue:0.9686274529,alpha:1)),Color(#colorLiteral(red:0.5568627715,green:0.3529411852,blue:0.9686274529,alpha:1))]),startPoint:.topTrailing,endPoint:.bottomLeading),
                    style: StrokeStyle(lineWidth: 4,lineCap: .round)
                )
                .frame(width: 44, height: 44)
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(
                    Angle(degrees: 180),
                    axis: (x: 1.0, y: 0.0, z: 0.0)
                )
                .shadow(color: Color(#colorLiteral(red:0.568627715, green:0.3529411852,blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 3, x: 0, y: 3)
            // 数值文字
            Text("82%")
                .font(.subheadline)
                .bold()
        }
    }
}

#Preview {
    RingView()
}
