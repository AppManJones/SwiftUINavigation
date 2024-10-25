# SwiftUINavigation

`SwiftUINavigation` is a modular and scalable navigation framework for SwiftUI, structured around a router-driven architecture. The framework is designed to simplify navigation in complex SwiftUI applications, supporting multiple navigation types, including push, sheet, and full-screen cover presentations. It leverages protocols for flexible, type-safe navigation and dynamic screen creation, making it testable and adaptable for evolving app requirements.

## Key Components

The `SwiftUINavigation` architecture relies on a few core components to manage and organize navigation flow:

### 1. **Router** (`AppRouterProtocol`)

The `Router` is the central component responsible for handling navigation events, managing the navigation stack, and controlling sheet and full-screen cover presentations. The `AppRouterProtocol` defines the requirements for any router, including methods for pushing and popping views and displaying modals.

- **Path Navigation**: Manages a `NavigationPath` that tracks the stack of views presented within the app.
- **Modal Presentations**: Supports presenting and dismissing sheets and full-screen covers.
- **Screen Building**: Leverages a `ScreenFactory` to dynamically build views based on a `Screen` type.

**Example usage:**
```swift
let router = AppRouter(factory: MainAppScreenFactory())
router.push(.detail) // Pushes the `.detail` screen onto the navigation path.
router.presentSheet(.sheet) // Presents the `.sheet` screen as a modal sheet.
```

### 2. **Navigation Events** (`NavigationEventProtocol`)

The NavigationEventProtocol represents the events the router can handle, allowing for a streamlined and type-safe way to trigger navigation actions throughout the app. These events specify an eventType and an optional Screen and allow routing operations such as pushing, popping, and presenting sheets or full-screen covers.

**Example of Creating a Navigation Event**
```swift
let event = MainAppNavigationEvent(eventType: .push, screen: .home)
router.handle(event) // Triggers navigation to the home screen.
```

### 3. **Router View** (`RouterViewProtocol`)

RouterViewProtocol is a protocol that defines the required structure for a SwiftUI view that takes a Router and Content. RouterView conforms to this protocol, acting as a container view that dynamically displays the current navigation state by observing changes in the router.

- Uses `NavigationStack` to handle standard navigation.

- Uses `.sheet` and `.fullScreenCover` for modal presentations based on the router’s state.

**Example of Creating a Router View**
```swift
let router = AppRouter(factory: MainAppScreenFactory())
RouterView(router) {
router.build(.home) // Starts with the home view as the initial screen.
}
```

### 4. **Screen Factory** (`ScreenFactoryProtocol`)

The ScreenFactoryProtocol abstracts the creation of views associated with a Screen type. Each screen is constructed on-demand based on the type of screen provided. This factory pattern keeps screen creation logic isolated from navigation, simplifying the router’s responsibilities.

**Example of Defining a Screen Factory**
```swift
struct MainAppScreenFactory: ScreenFactoryProtocol {
    func build(_ screen: MainAppScreen) -> some View {
        switch screen {
        case .home: HomeView<AppRouter>()
        case .detail: DetailView<AppRouter>()
        // other cases
        }
    }
}
```

### 5. **Screen Protocol** (`ScreenProtocol`)

The ScreenProtocol defines the requirements for any screen type that will be managed by the router. Each screen conforms to Equatable, Hashable, and Identifiable, ensuring it can be uniquely represented within the navigation path.

**Example of Defining a Screen Enum**
```swift
enum MainAppScreen: ScreenProtocol {
    case home
    case detail
    
    var id: String {
        switch self {
        case .home: return "MainAppScreen.Home"
        case .detail: return "MainAppScreen.Detail"
        }
    }
}
```

## Example Project Structure

The following example demonstrates the use of the router, navigation events, and screen factory within the main app’s entry point:

```swift
@main
struct SwiftUINavigationApp: App {
    var body: some Scene {
        WindowGroup {
            RouterViewProvider.makeRouterView()
        }
    }
}

struct RouterViewProvider {
    static func makeRouterView() -> some View {
        let router = AppRouter(factory: MainAppScreenFactory())
        return RouterView(router) {
            router.build(.home) // Start with the home view.
        }
    }
}
```

## Limitations

- Encapsulation of Features in Swift Packages: Currently, this architecture does not support encapsulating collections of screens within separate Swift packages, which may limit modularization. Future improvements may explore support for managing feature modules independently.

## Conclusion

SwiftUINavigation offers a clean, modular, and extensible approach to handling navigation in SwiftUI apps. By separating concerns into routers, factories, and navigation events, this architecture allows for a flexible and testable navigation system that can be easily adapted and scaled with your app’s needs.

Feel free to explore each component and extend the framework based on your specific requirements. Contributions are welcome to improve this framework further!
