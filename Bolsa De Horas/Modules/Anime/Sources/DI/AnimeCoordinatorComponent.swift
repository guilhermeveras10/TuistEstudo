import NeedleFoundation
import Utility
import SwiftUI
import UIKit

public protocol AnimeCoordinatorBuilder {
    var coordinator: AnimeCoordinator { get }
}

public protocol AnimeCoordinatorDependency: Dependency {
    var navigationController: UINavigationController { get }
    var viewComponent: AnimeViewBuilder { get }
}

public final class AnimeCoordinatorComponent:
    Component<AnimeCoordinatorDependency>,
    AnimeCoordinatorBuilder
{
    public var coordinator: AnimeCoordinator {
        .init(
            navigationController: dependency.navigationController,
            featureView: dependency.viewComponent.animesView.view
        )
    }
}
