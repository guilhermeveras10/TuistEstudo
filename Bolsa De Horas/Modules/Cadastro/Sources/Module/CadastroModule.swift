import Utility
import NeedleFoundation
import Foundation

public final class CadastroModule {
    /// Identificador de action específico deste módulo (ex.: usado em deeplinks).
    public var identifierAction: String {
        ActionIdentifier.actionCadastro.rawValue
    }

    public let rootComponent: CadastroComponent

    public init(
        component: CadastroComponent
    ) {
        rootComponent = component
    }
}

extension CadastroModule: FeatureModule {
    public func isTransitionAvailable(for key: String) -> Bool {
        switch key {
        case ActionIdentifier.actionCadastro.rawValue:
            return true
        default:
            return false
        }
    }

    public func startTransition(
        in navigation: Navigatable?,
        options _: [URLQueryItem]?
    ) {
        rootComponent.coordinatorComponent.coordinator.start()
        rootComponent.start()

        let view = rootComponent.navigationController.uiViewController

        navigation?.present(
            view,
            animated: true,
            options: [],
            presentationStyle: .fullScreen,
            completion: nil
        )
    }
}
