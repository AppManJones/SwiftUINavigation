enum NavigationEventType<Screen: ScreenProtocol>: Equatable {
    case push(Screen)
    case showSheet(Screen)
    case showFullScreenCover(Screen)
}
