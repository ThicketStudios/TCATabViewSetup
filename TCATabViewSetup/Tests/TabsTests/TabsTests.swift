//
//  Test.swift
//  TCATabViewSetup
//
//  Created by Wyeth Shamp on 9/16/24.
//

import Testing
import ComposableArchitecture
@testable import Tabs
@testable import Home
@testable import Settings

@MainActor
struct TabsTest {

    @Test func tabSelected() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let store = TestStoreOf<TabsFeature>(initialState: TabsFeature.State()) {
            TabsFeature()
        }
        #expect(store.state.selectedTab == .home)
        await store.send(.tabSelected(.settings)) {
            $0.selectedTab = .settings
        }
    }

}
