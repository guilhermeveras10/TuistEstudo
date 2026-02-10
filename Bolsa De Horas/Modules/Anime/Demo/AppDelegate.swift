import SwiftUI
import Utility
import UIKit
import Anime

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return false
        }

        let window = UIWindow(windowScene: windowScene)
        if #available(iOS 18.0, *) {
            window.frame = windowScene.effectiveGeometry.coordinateSpace.bounds
        } else {
            window.frame = windowScene.coordinateSpace.bounds
        }
        window.backgroundColor = .systemBackground

        let module = AnimeModule(component: .init())
        let controller = module.startTransition(options: nil)
        controller.modalPresentationStyle = .fullScreen
        controller.view.backgroundColor = .systemBackground
        controller.view.frame = window.bounds

        window.rootViewController = controller
        window.makeKeyAndVisible()

        self.window = window
        return true
    }
}
