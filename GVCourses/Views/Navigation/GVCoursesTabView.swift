//
//  ContentView.swift
//  GVCourses
//
//  Created by Minh Tran on 01/10/2023.
//

import SwiftUI

struct GVCoursesTabView: View {
    
    @State var selectedTab = 0
    
    @StateObject var newsStore = NewsStore()
    @StateObject var courseStore = CourseStore()
    @StateObject var userStore = UserStore()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                NewsListView().environmentObject(newsStore).tag(0)
                CoursesListView().environmentObject(courseStore).tag(1)
                SettingsView().environmentObject(userStore).tag(2)
            }
            
            ZStack{
                HStack{
                    ForEach((TabbedItems.allCases), id: \.self){ item in
                        Button{
                            selectedTab = item.rawValue
                        } label: {
                            CustomTabItem(
                                imageName: item.iconName,
                                title: item.title,
                                isActive: (selectedTab == item.rawValue)
                            )
                        }
                    }
                }
                .padding(6)
            }
            .frame(height: 60)
            .background(Color("brandSecondary").opacity(0.5))
            .cornerRadius(10)
            .padding(.horizontal, 26)
        }.ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

enum TabbedItems: Int, CaseIterable{
    case home = 0
    case courses
    case settings
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .courses:
            return "All courses"
        case .settings:
            return "Settings"
        }
        
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "house.fill"
        case .courses:
            return "book.fill"
        case .settings:
            return "person.fill"
        }
    }
}

extension GVCoursesTabView {
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View {
        HStack(spacing: 10) {
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.white)
                .frame(width: 20, height: 20)
            if isActive {
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .frame(width: isActive ? nil : 50, height: 50)
        .background(isActive ? Color("brandPrimary").opacity(0.7) : .clear)
        .cornerRadius(5)
    }
}

#Preview {
    GVCoursesTabView()
}
