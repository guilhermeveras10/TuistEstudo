import NeedleFoundation
import Utility
import SwiftUI
import UIKit

public protocol AnimeCoordinatorBuilder {
    var coordinator: HomeCoordinator { get }
}

public protocol AnimeCoordinatorDependency: Dependency {
    var navigationController: UINavigationController { get }
    var viewComponent: AnimeViewBuilder { get }
    var urlActionHandler: URLActionHandler { get }
}

public final class AnimeCoordinatorComponent:
    Component<AnimeCoordinatorDependency>,
    AnimeCoordinatorBuilder
{
    public var coordinator: HomeCoordinator {
        .init(
            navigationController: dependency.navigationController,
            featureView: dependency.viewComponent.animesView.view,
            urlActionHandler: dependency.urlActionHandler
        )
    }
}
