import Architecture
import SwiftUI

struct HomeView<Router: AppRouterProtocol>: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("Home")
                .frame(alignment: .center)
            Button("Show Detail") {
                handleShowDetails()
            }
            Button("Show Sheet") {
                handleShowSheet()
            }
            Button("Show Full Screen Cover") {
                handleShowFullScreenCover()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

private extension HomeView {
    func handleShowDetails() {
        let event = MainAppNavigationEvent(eventType: .push, screen: .detail)
        router.handle(event as! Router.NavigationEvent)
    }
    
    func handleShowSheet() {
        let event = MainAppNavigationEvent(eventType: .showSheet, screen: .sheet)
        router.handle(event as! Router.NavigationEvent)
    }
    
    func handleShowFullScreenCover() {
        let event = MainAppNavigationEvent(eventType: .showFullScreenCover, screen: .fullScreenCover)
        router.handle(event as! Router.NavigationEvent)
    }
}

//#Preview {
//    HomeView<AppRouter>()
//}
