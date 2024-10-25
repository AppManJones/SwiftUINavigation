import Architecture
import SwiftUI

struct DetailViewTwo<Router: AppRouterProtocol>: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("Detail2")
                .frame(alignment: .center)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
