import Alamofire
import Utility
import Combine
import NeedleFoundation
import SwiftUI

public final class AnimeComponent: BootstrapComponent,
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

    public var navigate: PassthroughSubject<AnimeNavigate, Never> {
        shared {
            PassthroughSubject<AnimeNavigate, Never>()
        }
    }

    public var api: Session {
        shared {
            Session.default
        }
    }

    public var repositoryComponent: AnimeRepositoryBuilder {
        shared {
            AnimeRepositoryComponent(parent: self)
        }
    }

    public var useCaseComponent: AnimeUseCaseBuilder {
        shared {
            AnimeUseCaseComponent(parent: self)
        }
    }

    public var coordinatorComponent: AnimeCoordinatorBuilder {
        AnimeCoordinatorComponent(parent: self)
    }

    public var factoryComponent: AnimeFactoryBuilder {
        AnimeFactoryComponent(parent: self)
    }

    public var viewComponent: AnimeViewBuilder {
        AnimeViewComponent(parent: self)
    }

    public var flowModel: AnimeFlowModel = .init()

    public override init() {
        _navigationController.modalPresentationStyle = .fullScreen
        _navigationController.view.backgroundColor = .systemBackground
        registerProviderFactories()
        super.init()
    }
}

// MARK: Handle screen navigation

extension AnimeComponent {
    public func start(_flowModel: AnimeFlowModel = .init()) {
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
