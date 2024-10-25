import Architecture
import SwiftUI

final
class AppRouter: AppRouterProtocol {
    
    typealias Factory = MainAppScreenFactory
    
    typealias NavigationEvent = MainAppNavigationEvent
    
    typealias Screen = MainAppScreen
    
    typealias V = AnyView

    
    @Published var fullScreenCover: Screen?
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Screen?

    var factory: Factory

    init(factory: Factory) {
        self.factory = factory
    }
    
    func build(_ screen: Screen) -> V {
        AnyView(factory.build(screen)
            .environmentObject(self))
        
    }
    
    func handle(_ event: NavigationEvent<MainAppScreenFactory>) {
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
