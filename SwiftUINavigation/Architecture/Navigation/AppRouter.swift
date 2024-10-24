import SwiftUI

final
class AppRouter: AppRouterProtocol {
    
    @Published var path: NavigationPath = NavigationPath()

    func build(_ screen: MainAppScreen) -> some View {
        MainAppScreenFactory().build(screen)
    }
    
    func handle(_ event: MainAppNavigationEvent) {
        switch event.type {
        case .push(let screen):
            push(screen)
        default:
            break
        }
    }
}
