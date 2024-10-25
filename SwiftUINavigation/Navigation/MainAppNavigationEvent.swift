import Architecture

struct MainAppNavigationEvent: NavigationEventProtocol {
    let eventType: NavigationEventType
    let screen: MainAppScreen?
    init(
        eventType: NavigationEventType,
        screen: MainAppScreen? = nil
    ) {
        self.eventType = eventType
        self.screen = screen
    }
}
