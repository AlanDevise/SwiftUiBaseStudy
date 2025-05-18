//
//  RingView.swift
//  SwiftUiBaseStudy
//
//  Created by Alan Zhang on 2025/5/18.
//

import SwiftUI

struct RingView: View {
    
    var color1 = Color(#colorLiteral(red:0.2588235438,green:0.7568627596,blue:0.9686274529,alpha:1));
    var color2 = Color(#colorLiteral(red:0.5568627715,green:0.3529411852,blue:0.9686274529,alpha:1));
    var width: CGFloat = 44;
    var height: CGFloat = 44;
    var percent:Double = 82;
    
    var body: some View {
        ZStack {
            // 进度值
            let progress = (100 - percent) / 100
            // 比例系数
            let multiplier = width / 44
            // 背景轨迹
            Circle()
                .stroke(
                    color1.opacity(0.1),
                    style: StrokeStyle(
                        lineWidth: 5 * multiplier,
                        lineCap: .round
                    )
                )
                .frame(width: width, height: height)
            // 这个进度条通过外圈圆进行2D旋转90度，再3D以X轴旋转180度实现，
            // 通过控制trim中from参数的值可以控制从12点方向逆时针的空缺大小
            Circle()
                .trim(from: progress, to: 1)
                .stroke(
                    LinearGradient(
                        gradient:Gradient(colors:[Color(color1),Color(color2)]),
                        startPoint:.topTrailing,
                        endPoint:.bottomLeading
                    ),
                    style: StrokeStyle(lineWidth: 4,lineCap: .round)
                )
                .frame(width: width, height: height)
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(
                    Angle(degrees: 180),
                    axis: (x: 1.0, y: 0.0, z: 0.0)
                )
                .shadow(
                    color: color1.opacity(0.3),
                    radius: 3 * multiplier,
                    x: 0,
                    y: 3 * multiplier
                )
            // 数值文字（Double）类型的percent可能有小数点，用Int方法转换成整数显示
            Text("\(Int(percent))%")
                .font(.system(size: 14*multiplier))
                .bold()
        }
    }
}

#Preview {
    RingView(color1: .red,width: 88,height: 88)
}
