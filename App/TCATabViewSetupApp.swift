//
//  TCATabViewSetupApp.swift
//  TCATabViewSetup
//
//  Created by Wyeth Shamp on 9/16/24.
//

import SwiftUI
import Root
import ComposableArchitecture
@main
struct TCATabViewSetupApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    var body: some Scene {
        WindowGroup {
            RootView(store: self.appDelegate.store)
        }
    }
}
