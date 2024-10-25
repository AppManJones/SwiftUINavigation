import Architecture
import SwiftUI

struct RouterView<Router: AppRouterProtocol, Screen: ScreenProtocol, Content: View>: RouterViewProtocol where Router.Screen == Screen {

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
                    view(for: sheet)
                }
                .fullScreenCover(item: $router.fullScreenCover) { fullScreenCover in
                    view(for: fullScreenCover)
                }
        }
        .environmentObject(router)
    }
}

private extension RouterView {
    @ViewBuilder
    func view(for screen: Screen) -> some View {
        if let sheetRouter = AppRouter(factory: MainAppScreenFactory(),
                                       parent: router as? AppRouter) as? Router,
           let contentView = sheetRouter.build(screen) as? Content
        {
            RouterView(sheetRouter) { contentView }
        }
        else
        {
            EmptyView()
        }
    }
}
