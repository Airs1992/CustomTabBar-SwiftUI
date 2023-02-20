//
//  Tab.swift
//  CustomTabBar
//
//  Created by hong on 2023/02/20.
//

import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    let text: String
    let icon: String
    let tab: Tab
}

var tabItems = [
    TabItem(text: "ホーム", icon: "house", tab: .home),
    TabItem(text: "検索", icon: "magnifyingglass", tab: .explore),
    TabItem(text: "評価", icon: "square.and.pencil.circle", tab: .review),
    TabItem(text: "家計簿", icon: "calendar", tab: .calendar)
]

enum Tab {
    case home
    case explore
    case review
    case calendar
}

struct TabWidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct TabCenterXPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

