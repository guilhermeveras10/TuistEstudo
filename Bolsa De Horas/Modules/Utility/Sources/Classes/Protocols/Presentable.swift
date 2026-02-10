import UIKit

public protocol Presentable: AnyObject {
    func dismiss(animated flag: Bool, completion: (() -> Swift.Void)?)
    func present(
        _ viewControllerToPresent: UIViewController,
        animated flag: Bool,
        completion: (() -> Void)?
    )
    func present(
        _ viewControllerToPresent: UIViewController,
        animated flag: Bool,
        options: [NavigationOptions],
        completion: (() -> Void)?
    )
    func present(
        _ viewControllerToPresent: UIViewController,
        animated flag: Bool,
        options: [NavigationOptions],
        presentationStyle: UIModalPresentationStyle,
        completion: (() -> Void)?
    )
}

extension Presentable {
    public func present(
        _ viewControllerToPresent: UIViewController,
        animated flag: Bool,
        presentationStyle: UIModalPresentationStyle
    ) {
        present(
            viewControllerToPresent,
            animated: flag,
            options: [],
            presentationStyle: presentationStyle,
            completion: nil
        )
    }
}
