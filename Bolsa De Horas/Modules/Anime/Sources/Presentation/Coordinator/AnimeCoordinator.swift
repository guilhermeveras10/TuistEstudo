import Combine
import Utility
import Foundation
import SwiftUI
import UIKit

public final class AnimeCoordinator {
    let navigationController: UINavigationController
    let featureView: any View

    public init(
        navigationController: UINavigationController,
        featureView: any View
    ) {
        self.navigationController = navigationController
        self.featureView = featureView
    }

    public func start() {
        navigationController.navigationBar.isHidden = true
        navigateToFeature()
    }

    public func navigateToFeature() {
        navigationController.pushViewController(
            featureView.viewControllerNoSafeArea,
            animated: true
        )
    }
    
    public func navigateToDeeplink(_ deepLink: URL) {
        URLActionHandler.shared.handle(url: deepLink)
    }
}
