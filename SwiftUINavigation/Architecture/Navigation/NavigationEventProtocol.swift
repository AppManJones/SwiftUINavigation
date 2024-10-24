protocol NavigationEventProtocol: Equatable {
    associatedtype Factory: ScreenFactoryProtocol
    var type: NavigationEventType<Factory.Screen> { get }
    var screenFactory: Factory { get }
    init(
        screenFactory: Factory,
        type: NavigationEventType<Factory.Screen>
    )
}

extension NavigationEventProtocol {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.screenFactory == rhs.screenFactory && lhs.type == rhs.type
    }
}
