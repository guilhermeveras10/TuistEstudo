import Combine
import Utility
import Foundation
import SwiftUI
import UIKit

public final class HomeCoordinator {
    public let navigationController: UINavigationController
    private let featureView: any View
    private let urlActionHandler: URLActionHandler

    public init(
        navigationController: UINavigationController,
        featureView: any View = HomeBuilder.make(),
        urlActionHandler: URLActionHandler = .shared
    ) {
        self.navigationController = navigationController
        self.featureView = featureView
        self.urlActionHandler = urlActionHandler
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

    @discardableResult
    public func navigateToDeeplink(_ deepLink: URL) -> Bool {
        urlActionHandler.handle(url: deepLink)
    }
}
