//
//  Modifiers.swift
//  SwiftUiBaseStudy
//
//  Created by Alan Zhang on 2025/5/18.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    
    var color:Color = .black
    var radius:CGFloat = 10
    
    
    func body(content: Content) -> some View {
        content
            .shadow(color:color.opacity(0.2), radius: radius,x:0,y:10)
            .shadow(color:color.opacity(0.1), radius: 1,x:0,y:1)
    }
}

struct FontModifier: ViewModifier {
    
    var style:Font.TextStyle = .body
    var design:Font.Design = .default
    
    func body(content: Content) -> some View {
        content
            .font(.system(style, design: design))
    }
}


struct CustomFontModifier: ViewModifier {
    
    var fontSize:CGFloat = 28
    
    func body(content: Content) -> some View {
        content
            .font(.custom("WorkSans-Bold",size: fontSize))
    }
}


struct CornerRadiusModifier: ViewModifier {
    var radius:CGFloat = 20
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: radius))
    }
}
