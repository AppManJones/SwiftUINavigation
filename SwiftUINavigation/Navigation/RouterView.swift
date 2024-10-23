import Architecture
import SwiftUI

struct RouterView<Router: AppRouterProtocol, Screen: ScreenProtocol>: View {
    @EnvironmentObject var router: Router
    
    init() {}
    
    var body: some View {
        NavigationStack(path: $router.path) {
            MainAppScreenFactory().build(.home)
                .navigationDestination(for: Screen.self) { screen in
                    router.build(screen)
                }
        }
        .environmentObject(router)
    }
}
