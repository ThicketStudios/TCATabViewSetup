import Testing
import ComposableArchitecture
@testable import Root
@testable import Tabs

@MainActor
struct RootTests {
    @Test func didFinishLaunching() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let store = TestStoreOf<RootFeature>(initialState: RootFeature.State()) {
            RootFeature()
        }
        #expect(store.state.mode == .launching)
        
        await store.send(.didFinishLaunching) {
            $0.mode = .tabs(TabsFeature.State())
        }
    }
}
