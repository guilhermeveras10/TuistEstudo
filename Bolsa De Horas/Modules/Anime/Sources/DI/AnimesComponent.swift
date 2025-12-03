import Alamofire
import Utility
import Combine
import NeedleFoundation
import SwiftUI

public final class AnimesComponent: BootstrapComponent,
    NavigationSubscriber
{
    public var navigationBag = Set<AnyCancellable>()

    // MARK: Navigation internal dependencies

    public var _navigationController = UINavigationController()

    // MARK: Dependencies

    public var navigationController: UINavigationController {
        shared {
            _navigationController
        }
    }

    public var navigate: PassthroughSubject<AnimesNavigate, Never> {
        shared {
            PassthroughSubject<AnimesNavigate, Never>()
        }
    }

    public var api: Session {
        shared {
            Session.default
        }
    }

    public var repositoryComponent: AnimesRepositoryBuilder {
        shared {
            AnimesRepositoryComponent(parent: self)
        }
    }

    public var useCaseComponent: AnimesUseCaseBuilder {
        shared {
            AnimesUseCaseComponent(parent: self)
        }
    }

    public var coordinatorComponent: AnimesCoordinatorBuilder {
        AnimesCoordinatorComponent(parent: self)
    }

    public var factoryComponent: AnimesFactoryBuilder {
        AnimesFactoryComponent(parent: self)
    }

    public var viewComponent: AnimesViewBuilder {
        AnimesViewComponent(parent: self)
    }

    public var repository: AnimeRepositoryProtocol {
        repositoryComponent.repository
    }

    public var useCase: AnimesUseCaseProtocol {
        useCaseComponent.useCase
    }

    public var viewModel: ViewModel {
        factoryComponent.viewModel
    }

    public var featureView: AnyView {
        viewComponent.featureView
    }

    public var urlActionHandler: URLActionHandler {
        shared {
            _urlActionHandler
        }
    }

    public var flowModel: HomeFlowModel = .init()

    // MARK: Injected parameters

    private let _urlActionHandler: URLActionHandler

    public init(
        _urlActionHandler: URLActionHandler = .shared
    ) {
        registerProviderFactories()
        self._urlActionHandler = _urlActionHandler
        super.init()
    }
}

// MARK: Handle screen navigation

extension AnimesComponent {
    public func start(_flowModel: HomeFlowModel = .init()) {
        flowModel = _flowModel
        cancelNavigationSubscriptions()
        setupNavigationSubscriptions()
    }

    public func setupNavigationSubscriptions() {
        navigate.sink { navigate in
            switch navigate {
            case .dismiss:
                self.coordinatorComponent.coordinator.navigationController
                    .dismiss(animated: true)
            case .goBack:
                self.coordinatorComponent.coordinator.navigationController
                    .popViewController(animated: true)
            case .navigateToModule(let module):
                self.coordinatorComponent.coordinator.navigateToDeeplink(module)
            }
        }.store(in: &navigationBag)
    }

    public func cancelNavigationSubscriptions() {
        navigationBag.forEach { $0.cancel() }
        navigationBag.removeAll()
    }
}
