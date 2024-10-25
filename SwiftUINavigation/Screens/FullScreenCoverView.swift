import Architecture
import SwiftUI

struct FullScreenCoverView<Router: AppRouterProtocol>: View {
    
    @EnvironmentObject var router: Router

    var body: some View {
        VStack {
            HStack {
                Button(action: dismiss) {
                    Image(systemName: "xmark")
                }
                .padding(.leading, 20)
                Spacer()
            }
            Spacer()
            Text("Full Screen Cover")
                .frame(alignment: .center)
            Spacer()
            Text("Bottom")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.lightGray))
    }
}

private extension FullScreenCoverView {
    func dismiss() {
        let event = MainAppNavigationEvent(eventType: .dismissFullScreenCover)
        router.handle(event as! Router.NavigationEvent)
    }
}
