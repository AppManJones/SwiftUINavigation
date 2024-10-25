import Architecture
import SwiftUI

struct RouterView<Router: AppRouterProtocol, Screen: ScreenProtocol>: View where Router.Screen == Screen {
    @EnvironmentObject var router: Router
    
    init() {}
    
    var body: some View {
        NavigationStack(path: $router.path) {
            MainAppScreenFactory().build(.home)
                .navigationDestination(for: Screen.self) { screen in
                    router.build(screen)
                }
                .sheet(item: $router.sheet) { sheet in
                    router.build(sheet)
                }
                .fullScreenCover(item: $router.fullScreenCover) { fullScreenCover in
                    router.build(fullScreenCover)
                }
        }
        .environmentObject(router)
    }
}
