import NeedleFoundation
import Utility
import SwiftUI
import UIKit

public protocol CadastroCoordinatorBuilder {
    var coordinator: HomeCoordinator { get }
}

public protocol CadastroCoordinatorDependency: Dependency {
    var navigationController: UINavigationController { get }
    var viewComponent: CadastroViewBuilder { get }
    var urlActionHandler: URLActionHandler { get }
}

public final class CadastroCoordinatorComponent:
    Component<CadastroCoordinatorDependency>,
    CadastroCoordinatorBuilder
{
    public var coordinator: HomeCoordinator {
        .init(
            navigationController: dependency.navigationController,
            featureView: dependency.viewComponent.cadastrosView.view,
            urlActionHandler: dependency.urlActionHandler
        )
    }
}
