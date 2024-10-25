import Architecture
import SwiftUI

struct MainAppScreenFactory: ScreenFactoryProtocol {
    @ViewBuilder
    func build(_ screen: MainAppScreen) -> some View {
        switch screen {
        case .detail:
            DetailView<AppRouter>()
        case .detailTwo:
            DetailViewTwo<AppRouter>()
        case .fullScreenCover:
            FullScreenCoverView<AppRouter>()
        case .home:
            HomeView<AppRouter>()
        case .sheet:
            SheetView<AppRouter>()
        }
    }
}
