import Architecture
import SwiftUI

struct SheetView<Router: AppRouterProtocol>: View {
    
    @EnvironmentObject var router: Router

    var body: some View {
        VStack(spacing: 20) {
            Text("Top")
                .padding(.top, 20)
            Spacer()
            Text("Sheet")
                .frame(alignment: .center)
            Button("Show Detail 2") {
                handleShowDetailTwo()
            }
            Button("Dismiss") {
                handleDismissSheet()
            }
            Spacer()
            Text("Bottom")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

private extension SheetView {
    func handleDismissSheet() {
        let event = MainAppNavigationEvent(eventType: .dismissSheet)
        router.handle(event as! Router.NavigationEvent)
    }
    
    func handleShowDetailTwo() {
        let event = MainAppNavigationEvent(eventType: .push, screen: .detail)
        router.handle(event as! Router.NavigationEvent)
    }
}


