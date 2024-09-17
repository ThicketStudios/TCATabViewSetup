//
//  SwiftUIView.swift
//  TCATabViewSetup
//
//  Created by Wyeth Shamp on 9/16/24.
//

import SwiftUI
import ComposableArchitecture

@Reducer
public struct HomeFeature {
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


public struct HomeView: View {
    @Bindable var store: StoreOf<HomeFeature>
    public init(store: StoreOf<HomeFeature>) {
        self.store = store
    }
    public var body: some View {
        Text("Home View")
    }
}

#Preview {
    HomeView(store: Store(initialState: HomeFeature.State()) {
        HomeFeature()
    })
}
