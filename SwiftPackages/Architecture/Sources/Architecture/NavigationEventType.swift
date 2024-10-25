public
enum NavigationEventType<Screen: ScreenProtocol>: Equatable {
    case dismissFullScreenCover
    case dismissSheet
    case push(Screen)
    case pop
    case showSheet(Screen)
    case showFullScreenCover(Screen)
}
