import Architecture

enum MainAppScreen: ScreenProtocol {
    case home
    case detail
    var id: Self { return self }
}
