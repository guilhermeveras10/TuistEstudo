import UIKit

public protocol Navigatable: Presentable {
    func setViewControllers(
        _ viewControllers: [UIViewController],
        animated: Bool,
        completion: (() -> Void)?
    )
    func pushViewController(
        _ viewController: UIViewController,
        animated: Bool,
        options: [NavigationOptions]
    )
    func pushViewController(_ viewController: UIViewController, animated: Bool)
    func popToViewController<T: UIViewController>(
        _ viewController: T.Type,
        animated: Bool
    )
    @discardableResult
    func popViewController(animated: Bool) -> UIViewController?
    @discardableResult
    func popToRootViewController(animated: Bool) -> [UIViewController]?
    var delegate: UINavigationControllerDelegate? { get set }
}

extension Navigatable {
    public func popToViewController<T: UIViewController>(
        _: T.Type,
        animated _: Bool
    ) {}
}
