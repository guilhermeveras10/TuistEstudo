import Foundation
import UIKit

public protocol FeatureModule {
    /// Method verify if the transition is available
    /// - Parameter key: transition path
    func isTransitionAvailable(for key: String) -> Bool

    /// Starts transition and returns the root view controller to be displayed.
    func startTransition(options: [URLQueryItem]?) -> UIViewController

    /// IdentifierAction
    var identifierAction: String { get }
}
