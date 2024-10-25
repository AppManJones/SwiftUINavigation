import Architecture
import SwiftUI

struct RouterView<Router: AppRouterProtocol, Screen: ScreenProtocol, Content: View>: View where Router.Screen == Screen {

    @StateObject var router: Router
    
    private let content: () -> Content

    init(_ router: Router, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        _router = StateObject(wrappedValue: router)
    }
    
    var body: some View {
        NavigationStack(path: $router.path) {
            content()
                .navigationDestination(for: Screen.self) { screen in
                    router.build(screen)
                }
                .sheet(item: $router.sheet) { sheet in
                    if let sheet = sheet as? MainAppScreen {
                        let sheetRouter = AppRouter(factory: $router.factory.wrappedValue as! MainAppScreenFactory)
                        RouterView(sheetRouter as! Router) {
                            sheetRouter.build(sheet) as! Content
                        }
                    } else {
                        EmptyView()
                    }
                }
                .fullScreenCover(item: $router.fullScreenCover) { fullScreenCover in
                    router.build(fullScreenCover)
                }
        }
        .environmentObject(router)
    }
}
