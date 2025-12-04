import Utility
import Anime
import SwiftUI
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var navigatable: NavigationControllerNavigatable?

    func application(
        _: UIApplication,
        didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        setupMainWindow()
        configureNavigationBarAppearance()
        return true
    }

    private func setupMainWindow() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return
        }

        let window = UIWindow(windowScene: windowScene)
        self.window = window

        let contentView = ContentView(startModule: startModule)

        let hostingController = UIHostingController(rootView: contentView)

        let navigationController = UINavigationController(
            rootViewController: hostingController
        )

        navigatable = NavigationControllerNavigatable(
            navigationController: navigationController
        )

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    private func configureNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()

        appearance.backgroundColor = UIColor.black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    private func startModule() {
        if let navigatable = navigatable {
            let module =
                AnimeModule(
                    component: .init(
                        _urlActionHandler: URLActionHandler.shared
                    )
                )
            module.startTransition(
                in: navigatable,
                options: nil
            )
        }
    }
}
