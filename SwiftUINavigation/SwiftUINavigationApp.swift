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
        let router = AppRouter(factory: mainScreenFactory, screenType: MainAppScreen.self)
        return RouterView<AppRouter, MainAppScreen>()
            .environmentObject(router)
    }
}




//public protocol FeatureModule {
//    associatedtype Factory: ScreenFactory
//    func registerScreens(with registry: ScreenFactoryRegistry<Factory>)
//}
//
//struct ArchitecturalDemoFeatureModule: FeatureModule {
//    func registerScreens(with registry: ScreenFactoryRegistry<ArchitecturalDemoScreenFactory>) {
//        let factory = ArchitecturalDemoScreenFactory()
//        registry.registerFactory(factory)
//    }
//}
