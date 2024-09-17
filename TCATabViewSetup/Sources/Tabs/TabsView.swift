//
//  SwiftUIView.swift
//  TCATabViewSetup
//
//  Created by Wyeth Shamp on 9/16/24.
//

import SwiftUI
import ComposableArchitecture
import Home
import Settings

public enum Tab: Equatable {
    case home
    case settings
}

@Reducer
public struct TabsFeature {
    public init(){}
    @ObservableState
    public struct State: Equatable {
        public init(selectedTab: Tab = .home){
            self.selectedTab = selectedTab
            self.homeTab = HomeFeature.State()
            self.settingsTab = SettingsFeature.State()
        }
        var selectedTab: Tab
        var homeTab: HomeFeature.State
        var settingsTab: SettingsFeature.State
    }
    public enum Action {
        case tabSelected(Tab)
        case homeTab (HomeFeature.Action)
        case settingsTab(SettingsFeature.Action)
    }
    public var body: some ReducerOf<Self> {
        Scope(state: \.homeTab, action: \.homeTab) {
              HomeFeature()
        }
        Scope(state: \.settingsTab, action: \.settingsTab) {
              SettingsFeature()
        }
        Reduce { state, action in
            switch action {
            case let .tabSelected(tab):
                state.selectedTab = tab
                return .none
            case .homeTab, .settingsTab:
                return .none
            }
        }
    }
}

public struct TabsView: View {
    @Bindable var store: StoreOf<TabsFeature>
    public init(store: StoreOf<TabsFeature>) {
        self.store = store
    }
    public var body: some View {
        TabView(selection: $store.selectedTab.sending(\.tabSelected)) {
            HomeView(store: store.scope(
                state: \.homeTab,
                action: \.homeTab))
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            .tag(Tab.home)
            
            SettingsView(store: store.scope(
                state: \.settingsTab,
                action:\.settingsTab))
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
            .tag(Tab.settings)
        }
    }
}

#Preview {
    TabsView(store: Store(initialState: TabsFeature.State()) {
        TabsFeature()
    })
}
