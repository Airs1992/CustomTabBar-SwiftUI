//
//  TabBar.swift
//  CustomTabBar
//
//  Created by hong on 2023/02/20.
//

import SwiftUI

struct TabBar: View {

    @State var selectedTab: Tab = .home
    @State var color: Color = .black
    @State var tabItemWidth: CGFloat = 0

    var body: some View {
        ZStack(alignment: .bottom) {

            Group {
                switch selectedTab {
                case .home:
                    ContentView()
                case .explore:
                    ContentView2()
                case .review:
                    ContentView3()
                case .calendar:
                    ContentView4()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            HStack {
                ForEach(tabItems) { item in
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            selectedTab = item.tab
                        }
                    } label: {
                        VStack(spacing: 0) {
                            Image(systemName: item.icon)
                                .symbolVariant(.fill)
                                .font(.body.bold())
                                .frame(width: 44, height: 29)
                            Text(item.text)
                                .font(.caption2)
                                .lineLimit(1)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
                    .overlay(
                        GeometryReader { proxy in
                            Color.clear.preference(key: TabWidthPreferenceKey.self, value: proxy.size.width)
                        }
                    )
                    .onPreferenceChange(TabWidthPreferenceKey.self) { value in
                        tabItemWidth = value
                    }
                }
            }
            .padding(.horizontal, 8)
            .padding(.top, 14)
            .frame(height: 88, alignment: .top)
            .background(.ultraThinMaterial)
            .background(
                background
            )
            .overlay(
                overlay
            )
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
    }

    var background: some View {
        HStack {
            if selectedTab == .calendar { Spacer() }
            if selectedTab == .explore { Spacer() }
            if selectedTab == .review {
                Spacer()
                Spacer()
            }
            Circle().fill(Color.clear).frame(width: tabItemWidth)
            if selectedTab == .home { Spacer() }
            if selectedTab == .explore {
                Spacer()
                Spacer()
            }
            if selectedTab == .review { Spacer() }
        }
        .padding(.horizontal, 8)
    }

    var overlay: some View {
        HStack {
            if selectedTab == .calendar { Spacer() }
            if selectedTab == .explore { Spacer() }
            if selectedTab == .review {
                Spacer()
                Spacer()
            }
            Rectangle()
                .fill(color)
                .frame(width: 28, height: 5)
                .cornerRadius(3)
                .frame(width: tabItemWidth)
                .frame(maxHeight: .infinity, alignment: .top)
            if selectedTab == .home { Spacer() }
            if selectedTab == .explore {
                Spacer()
                Spacer()
            }
            if selectedTab == .review { Spacer() }
        }
        .padding(.horizontal, 8)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

