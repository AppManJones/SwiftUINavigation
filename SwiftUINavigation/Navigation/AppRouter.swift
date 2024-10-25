import Architecture
import SwiftUI

final
class AppRouter: AppRouterProtocol {
    typealias NavigationEvent = MainAppNavigationEvent
    
    @Published var path = NavigationPath()
    @Published var sheet: MainAppScreen?
    @Published var fullScreenCover: MainAppScreen?
    
    var factory: MainAppScreenFactory
    
    init(factory: MainAppScreenFactory) {
        self.factory = factory
    }

    @ViewBuilder
    func build(_ screen: MainAppScreen) -> some View {
        factory.build(screen)
    }

    func handle(_ event: NavigationEvent) {
        switch event.eventType {
        case .dismissSheet:
            dismissSheet()
        case .dismissFullScreenCover:
            dismissFullScreenCover()
        case .pop:
            pop()
        case .push:
            if let screen = event.screen {
                push(screen)
            }
        case .showSheet:
            if let screen = event.screen {
                presentSheet(screen)
            }
        case .showFullScreenCover:
            if let screen = event.screen {
                presentFullScreenCover(screen)
            }
        }
    }
}
