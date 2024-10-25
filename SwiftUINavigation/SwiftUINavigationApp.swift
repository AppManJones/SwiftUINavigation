import Architecture
import SwiftUI

@main
struct SwiftUINavigationApp: App {
    var body: some Scene {
        WindowGroup {
            RouterViewProvider.makeRouterView()
        }
    }
}

struct RouterViewProvider {
    static func makeRouterView() -> some View {
        let router = AppRouter(factory: MainAppScreenFactory())
        return RouterView(router) {
            router.build(.home)
        }
    }
}
