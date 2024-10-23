import Architecture

struct MainAppNavigationEvent<F: ScreenFactoryProtocol>: NavigationEventProtocol {
    typealias Factory = F
    typealias Screen = MainAppScreen

    var screenFactory: F
    var type: NavigationEventType<F.Screen>

    init(
        screenFactory: F = MainAppScreenFactory(),
        type: NavigationEventType<F.Screen>
    ) {
        self.screenFactory = screenFactory
        self.type = type
    }
}
