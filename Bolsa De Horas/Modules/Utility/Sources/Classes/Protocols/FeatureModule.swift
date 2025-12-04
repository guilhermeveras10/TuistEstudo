import Foundation

public protocol FeatureModule {
    /// Method verify if the transition is available
    /// - Parameter key: transition path
    func isTransitionAvailable(for key: String) -> Bool

    /// Starts transition in specified navigation controller
    func startTransition(
        in navigation: Navigatable?,
        options: [URLQueryItem]?
    )

    /// IdentifierAction
    var identifierAction: String { get }
}
