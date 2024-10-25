public
protocol NavigationEventProtocol {
    associatedtype Screen: ScreenProtocol
    var eventType: NavigationEventType { get }
    var screen: Screen? { get }
}
