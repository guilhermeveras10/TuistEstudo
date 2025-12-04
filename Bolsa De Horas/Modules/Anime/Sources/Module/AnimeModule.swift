import Utility
import NeedleFoundation
import Foundation

public final class AnimeModule {
    /// Identificador de action específico deste módulo (ex.: usado em deeplinks).
    public var identifierAction: String {
        ActionIdentifier.actionAnime.rawValue
    }

    public let rootComponent: AnimeComponent

    public init(
        component: AnimeComponent
    ) {
        rootComponent = component
    }
}

extension AnimeModule: FeatureModule {
    public func isTransitionAvailable(for key: String) -> Bool {
        switch key {
        case ActionIdentifier.actionAnime.rawValue:
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
            presentationStyle: .currentContext,
            completion: nil
        )
    }
}
