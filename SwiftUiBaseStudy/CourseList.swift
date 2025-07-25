//
//  CourseList.swift
//  SwiftUiBaseStudy
//
//  Created by Alan Zhang on 2025/5/25.
//

import SwiftUI

struct CourseList: View {
    
    @State var active = false
    @State var courses = courseData
    @State var activeIndex =  -1
    @State var activeView = CGSize.zero
    
    
    var body: some View {
        ZStack {
            Color.black.opacity(Double(activeView.height/100))
                .ignoresSafeArea(.all)
            ScrollView(showsIndicators: !active) {
                VStack(spacing: 30.0) {
                    Text("Course List")
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top,30)
                        .padding(.leading,30)
                        .blur(radius: active ? 20:0)
                    ForEach(courses.indices, id:\.self) { index in
                        let show = courses[index].show
                        GeometryReader { geometry in
                            CourseView(show:$courses[index].show, course: courses[index], active:$active, index:index, activeIndex:$activeIndex, activeView: $activeView)
                                .offset(y:show ? -geometry.frame(in: .global).minY:0)
                                .opacity(active && activeIndex != index ? 0 : 1)
                                .scaleEffect(active && activeIndex != index ? 0.5 : 1)
                                .offset(x:active && activeIndex != index ? screen.width : 0)
                        }
                        .frame(height: show ? screen.height:280)
                        .frame(maxWidth: show ? .infinity : screen.width - 60)
                        .zIndex(show ? 1 : 0)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .environment(\.isScrollEnabled, !active)    // 两层滑动，仅用掉一层
            
        }
        .animation(.default, value: active)
        .statusBarHidden(active)    // 隐藏状态栏
    }
}

#Preview {
    CourseList()
}

struct CourseView: View {
    
    @Binding var show : Bool
    var course:Course
    @Binding var active:Bool
    
    var index: Int
    @Binding var activeIndex:Int
    
    @Binding var activeView: CGSize
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.white
                .ignoresSafeArea(.all)
                .clipShape(RoundedRectangle(cornerRadius: 30))
            // content
            VStack(alignment: .leading, spacing: 30.0) {
                Text("Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.")
                Text("About this course")
                    .font(.title).bold()
                Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for ios and macos. while it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance.It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
                Text("Minimal coding experience required, such as in HTML and css. Please note that  Xcode 11 and Catalina are essential. Once you get everything installed, it'11 get a lot friendlier! I added a bunch of troubleshoots at the end of this page to help you navigate the issues you might encounter.")
            }
            .padding(30)
            .frame(maxWidth: show ? .infinity : screen.width - 60)
            .frame(maxHeight: show ? screen.height : 280, alignment: .top)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .shadow(color:.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: show ? 460 : 0)
            .opacity(show ? 1 : 0)
            .gesture(
                show ? DragGesture()
                    .onChanged({ value in
                        // 通过guard限制拖拽范围
                        guard value.translation.height < 300 else { return }
                        guard value.translation.height > 0 else { return }
                        activeView = value.translation
                    })
                    .onEnded({ value in
                        if activeView.height > 50 {
                            show = false
                            active = false
                            activeIndex = -1
                        }
                        activeView = .zero
                    }) : nil
            )
            
            // Card
            VStack {
                HStack {
                    VStack(alignment:.leading, spacing: 8.0){
                        Text(course.title)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(.white)
                        Text(course.subtitle)
                            .foregroundStyle(.white.opacity(0.7))
                    }
                    Spacer()
                    ZStack {
                        Image(uiImage: course.logo)
                            .opacity(show ? 0 : 1)
                        Image(systemName: "xmark")
                            .font(.system(size: 26,weight: .medium))
                            .foregroundStyle(.white)
                            .frame(width: 36, height: 36)
                            .background(.black)
                            .clipShape(Circle())
                            .opacity(show ? 1 : 0)
                            .onTapGesture {
                                show = false
                                active = false
                                activeIndex = -1
                            }
                    }
                }
                Spacer()
                Image(uiImage: course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 140, alignment: .top)
            }
            .padding(20)
            .padding(.top,show ? 30 : 0)
            // .frame(width:show ? screen.width : screen.width - 60, height:show ? screen.height : 240)
            .frame(maxWidth:show ? .infinity : screen.width - 60, maxHeight:show ? 460 : 280)
            .background(Color(uiColor: course.color))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .shadow(color: Color(uiColor: course.color).opacity(0.3), radius: 20, x: 0, y: 20)
            .gesture(
                show ? DragGesture()
                    .onChanged({ value in
                        // 通过guard限制拖拽范围
                        guard value.translation.height < 300 else { return }
                        guard value.translation.height > 0 else { return }
                        activeView = value.translation
                    })
                    .onEnded({ value in
                        if activeView.height > 50 {
                            show = false
                            active = false
                            activeIndex = -1
                        }
                        activeView = .zero
                    }) : nil
            )
            .onTapGesture {
                if !show{
                    show = true
                    active = true
                    activeIndex = index
                }
            }
        }
        .scaleEffect(1-activeView.height/1000)
        .rotation3DEffect(
            Angle(degrees: activeView.height/10), axis: (x: 0.0, y: 1.0, z: 0.0)
        )
        .hueRotation(Angle(degrees: activeView.height))
        .ignoresSafeArea(.all)
        .animation(.spring(response: 0.5, dampingFraction: 0.6), value: show)
    }
}

struct Course:Identifiable {
    let id = UUID()
    var title:String
    var subtitle:String
    var image:UIImage
    var logo:UIImage
    var color:UIColor
    var show:Bool
}

var courseData = [
    Course(title:"Prototype Designs in SwiftUI",subtitle:"18 Sections",image:#imageLiteral(resourceName:"Background1"),logo:#imageLiteral(resourceName:"Logo1"),color: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529,alpha:1), show: false),
    Course(title:"SwiftUI Advanced", subtitle: "20 Sections", image: #imageLiteral(resourceName: "Card3"),logo: #imageLiteral(resourceName:"Logo1"), color:#colorLiteral(red:0.8549019694, green:0.250980407, blue:0.4784313738,alpha: 1), show: false),
    Course(title: "UI Design for Developers", subtitle:"20 Sections",image: #imageLiteral(resourceName:"Card4"),logo: #imageLiteral(resourceName:"Logo3"), color:#colorLiteral(red:0.2588235438, green:0.7568627596, blue:0.9686274529, alpha: 1), show: false)
]
