import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Detail")
                .frame(alignment: .center)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color.gray)
    }
}
