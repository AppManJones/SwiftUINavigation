import Architecture
import SwiftUI

final
class AppRouter: AppRouterProtocol {
    
    @Published var fullScreenCover: MainAppScreen?
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: MainAppScreen?

    private let factory: MainAppScreenFactory

    init(factory: MainAppScreenFactory) {
        self.factory = factory
    }
    
    func build(_ screen: MainAppScreen) -> some View {
        factory.build(screen)
            .environmentObject(self)
    }
    
    func handle(_ event: MainAppNavigationEvent<MainAppScreenFactory>) {
        switch event.type {
        case .dismissFullScreenCover:
            dismissFullScreenOver()
        case .dismissSheet:
            dismissSheet()
        case .pop:
            pop()
        case .push(let screen):
            push(screen)
        case .showSheet(let screen):
            presentSheet(screen)
        case .showFullScreenCover(let screen):
            presentFullScreenCover(screen)
        }
    }
}
