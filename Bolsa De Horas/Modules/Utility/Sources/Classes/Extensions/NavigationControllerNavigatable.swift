import Foundation
import UIKit

public class NavigationControllerNavigatable: Navigatable {
    private let navigationController: UINavigationController

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // Implementação dos métodos do protocolo Navigatable
    public func setViewControllers(
        _ viewControllers: [UIViewController],
        animated: Bool,
        completion: (() -> Void)?
    ) {
        navigationController.setViewControllers(
            viewControllers,
            animated: animated
        )
        completion?()
    }

    public func pushViewController(
        _ viewController: UIViewController,
        animated: Bool,
        options _: [NavigationOptions]
    ) {
        navigationController.pushViewController(
            viewController,
            animated: animated
        )
    }

    public func pushViewController(
        _ viewController: UIViewController,
        animated: Bool
    ) {
        navigationController.pushViewController(
            viewController,
            animated: animated
        )
    }

    public func popToViewController<T: UIViewController>(
        _: T.Type,
        animated: Bool
    ) {
        if let targetViewController = navigationController.viewControllers
            .first(where: { $0 is T })
        {
            navigationController.popToViewController(
                targetViewController,
                animated: animated
            )
        }
    }

    @discardableResult
    public func popViewController(animated: Bool) -> UIViewController? {
        navigationController.popViewController(animated: animated)
    }

    @discardableResult
    public func popToRootViewController(animated: Bool) -> [UIViewController]? {
        navigationController.popToRootViewController(animated: animated)
    }

    public var delegate: UINavigationControllerDelegate? {
        get {
            navigationController.delegate
        }
        set {
            navigationController.delegate = newValue
        }
    }

    // Implementação dos métodos do protocolo Presentable
    public func dismiss(animated flag: Bool, completion: (() -> Void)?) {
        navigationController.dismiss(animated: flag, completion: completion)
    }

    public func present(
        _ viewControllerToPresent: UIViewController,
        animated flag: Bool,
        completion: (() -> Void)?
    ) {
        navigationController.present(
            viewControllerToPresent,
            animated: flag,
            completion: completion
        )
    }

    public func present(
        _ viewControllerToPresent: UIViewController,
        animated flag: Bool,
        options _: [NavigationOptions],
        completion: (() -> Void)?
    ) {
        navigationController.present(
            viewControllerToPresent,
            animated: flag,
            completion: completion
        )
    }

    public func present(
        _ viewControllerToPresent: UIViewController,
        animated flag: Bool,
        options _: [NavigationOptions],
        presentationStyle: UIModalPresentationStyle,
        completion: (() -> Void)?
    ) {
        viewControllerToPresent.modalPresentationStyle = presentationStyle
        navigationController.present(
            viewControllerToPresent,
            animated: flag,
            completion: completion
        )
    }
}
