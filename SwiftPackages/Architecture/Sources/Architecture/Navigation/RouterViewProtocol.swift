import SwiftUI

public
protocol RouterViewProtocol: View {
    associatedtype Router: AppRouterProtocol
    associatedtype Content: View
    init(_ router: Router, @ViewBuilder content: @escaping () -> Content)
}
