//
//  SwiftUINavigationApp.swift
//  SwiftUINavigation
//
//  Created by Joseph Rouleau on 10/22/24.
//

import Architecture
import SwiftUI

@main
struct SwiftUINavigationApp: App {

    var body: some Scene {
        WindowGroup {
            RouterProvider.makeRouterView()
        }
    }
}

struct RouterProvider {
    static func makeRouterView() -> some View {
        let mainScreenFactory = MainAppScreenFactory()
        let router = AppRouter(factory: mainScreenFactory)
        return RouterView(router) {
            router.build(.home)
        }
    }
}
