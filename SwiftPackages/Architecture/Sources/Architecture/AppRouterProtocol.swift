import SwiftUI

public
protocol AppRouterProtocol: ObservableObject {
    associatedtype Factory: ScreenFactoryProtocol
    associatedtype NavigationEvent: NavigationEventProtocol
    associatedtype Screen: ScreenProtocol
    associatedtype V: View
    
    var factory: Factory { get }
    var fullScreenCover: Screen? { get set }
    var parent: Self? { get set }
    var path: NavigationPath { get set }
    var sheet: Screen? { get set }

    func build(_ screen: Screen) -> V
    func handle(_ event: NavigationEvent)
    func push(_ screen: Screen)
    func presentSheet(_ sheet: Screen)
    func presentFullScreenCover(_ fullScreenCover: Screen)
    func pop()
    func popToRoot()
    func dismissSheet()
    func dismissFullScreenCover()
}

public
extension AppRouterProtocol {
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func presentSheet(_ sheet: Screen) {
        self.sheet = sheet
    }
    
    func presentFullScreenCover(_ fullScreenCover: Screen) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.parent?.sheet = nil
    }
    
    func dismissFullScreenCover() {
        self.parent?.fullScreenCover = nil
    }
}
