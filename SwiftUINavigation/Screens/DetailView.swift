import Architecture
import SwiftUI

struct DetailView<Router: AppRouterProtocol>: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("Detail")
                .frame(alignment: .center)
            Button("Show Sheet") {
                handleShowSheet()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

private extension DetailView {
    func handleShowSheet() {
        let event = MainAppNavigationEvent(eventType: .showSheet, screen: .sheet)
        router.handle(event as! Router.NavigationEvent)
    }
}
