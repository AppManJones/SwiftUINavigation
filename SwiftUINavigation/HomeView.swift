import Architecture
import SwiftUI

struct HomeView<Router: AppRouterProtocol>: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            Spacer()
            Text("Home")
                .frame(alignment: .center)
            Button("Show Detail") {
                handleShowDetails()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

private extension HomeView {
    func handleShowDetails() {
        let event = MainAppNavigationEvent(screenFactory: MainAppScreenFactory(), type: .push(.detail))
        router.handle(event)
    }
}

//#Preview {
//    HomeView<AppRouter<MainAppNavigationEvent<MainAppScreenFactory>>>()
//}
