import Architecture

enum MainAppScreen: ScreenProtocol {
    case home
    case detail
    case detailTwo
    case fullScreenCover
    case sheet
    var id: Self { return self }
}
