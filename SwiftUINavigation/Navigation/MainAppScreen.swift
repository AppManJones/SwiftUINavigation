import Architecture

enum MainAppScreen: ScreenProtocol {
    case detail
    case detailTwo
    case fullScreenCover
    case home
    case sheet
    
    var id: String {
        switch self {
        case .detail: return "MainAppScreen.Detail"
        case .detailTwo: return "MainAppScreen.DetailTwo"
        case .fullScreenCover: return "MainAppScreen.FullScreenCover"
        case .home: return "MainAppScreen.Home"
        case .sheet: return "MainAppScreen.Settings"
        }
    }
}
