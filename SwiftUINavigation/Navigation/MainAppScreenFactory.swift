import Architecture
import SwiftUI

struct MainAppScreenFactory: ScreenFactoryProtocol {
    @ViewBuilder
    func build(_ screen: MainAppScreen) -> some View {
        switch screen {
        case .home:
            HomeView<AppRouter>()
        case .detail:
            DetailView()
        }
    }
}
