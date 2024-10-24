import SwiftUI

protocol AppRouterProtocol: ObservableObject {
    associatedtype NavigationEvent: NavigationEventProtocol
    associatedtype Screen: ScreenProtocol
    associatedtype V: View
    
    var path: NavigationPath { get set }

    func build(_ screen: Screen) -> V
    func handle(_ event: NavigationEvent)
    func push(_ screen: Screen)
    func pop()
    func popToRoot()
}


extension AppRouterProtocol {
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
