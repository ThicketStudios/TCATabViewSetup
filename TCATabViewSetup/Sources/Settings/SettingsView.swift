//
//  SwiftUIView.swift
//  TCATabViewSetup
//
//  Created by Wyeth Shamp on 9/16/24.
//

import SwiftUI
import ComposableArchitecture

@Reducer
public struct SettingsFeature {
    public init(){}
    @ObservableState
    public struct State: Equatable {
        public init(){}
    }
    public enum Action {}
    public var body: some ReducerOf<Self> {
        EmptyReducer()
    }
}

public struct SettingsView: View {
    @Bindable var store: StoreOf<SettingsFeature>
    public init(store: StoreOf<SettingsFeature>) {
        self.store = store
    }
    public var body: some View {
        Text("Settings View")
    }
}

#Preview {
    SettingsView(store: Store(initialState: SettingsFeature.State()) {
        SettingsFeature()
    })
}
