import Alamofire
import Utility
import Combine
import NeedleFoundation
import SwiftUI

public final class CadastroComponent: BootstrapComponent,
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

    public var navigate: PassthroughSubject<CadastroNavigate, Never> {
        shared {
            PassthroughSubject<CadastroNavigate, Never>()
        }
    }

    public var api: Session {
        shared {
            Session.default
        }
    }

    public var repositoryComponent: CadastroRepositoryBuilder {
        shared {
            CadastroRepositoryComponent(parent: self)
        }
    }

    public var useCaseComponent: CadastroUseCaseBuilder {
        shared {
            CadastroUseCaseComponent(parent: self)
        }
    }

    public var coordinatorComponent: CadastroCoordinatorBuilder {
        CadastroCoordinatorComponent(parent: self)
    }

    public var factoryComponent: CadastroFactoryBuilder {
        CadastroFactoryComponent(parent: self)
    }

    public var viewComponent: CadastroViewBuilder {
        CadastroViewComponent(parent: self)
    }

    public var urlActionHandler: URLActionHandler {
        shared {
            _urlActionHandler
        }
    }

    public var flowModel: CadastroFlowModel = .init()

    // MARK: Injected parameters

    private let _urlActionHandler: URLActionHandler

    public init(
        _urlActionHandler: URLActionHandler
    ) {
        _navigationController.modalPresentationStyle = .fullScreen
        _navigationController.view.backgroundColor = .systemBackground
        registerProviderFactories()
        self._urlActionHandler = _urlActionHandler
        super.init()
    }
}

// MARK: Handle screen navigation

extension CadastroComponent {
    public func start(_flowModel: CadastroFlowModel = .init()) {
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
