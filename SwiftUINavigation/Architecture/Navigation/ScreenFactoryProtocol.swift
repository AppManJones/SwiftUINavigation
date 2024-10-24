import SwiftUI

protocol ScreenFactoryProtocol: Equatable {
    associatedtype V: View
    associatedtype Screen: ScreenProtocol
    func build(_ screen: Screen) -> V
}
