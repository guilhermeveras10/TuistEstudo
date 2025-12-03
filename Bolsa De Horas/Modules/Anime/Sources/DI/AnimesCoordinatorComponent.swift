import NeedleFoundation
import SwiftUI
import UIKit

public protocol AnimesCoordinatorBuilder {
    var coordinator: HomeCoordinator { get }
}

public protocol AnimesCoordinatorDependency: Dependency {
    var navigationController: UINavigationController { get }
    var viewComponent: AnimesViewBuilder { get }
    var urlActionHandler: URLActionHandler { get }
}

public final class AnimesCoordinatorComponent:
    Component<AnimesCoordinatorDependency>,
    AnimesCoordinatorBuilder
{
    public var coordinator: HomeCoordinator {
        .init(
            navigationController: dependency.navigationController,
            featureView: dependency.viewComponent.featureView,
            urlActionHandler: dependency.urlActionHandler
        )
    }
}
