import Combine

/// Protocolo que define um componente capaz de assinar eventos de navegação e
/// cancelar essas assinaturas.
public protocol NavigationSubscriber: AnyObject {
    var navigationBag: Set<AnyCancellable> { get set }

    /// Configura a assinatura para os eventos de navegação.
    func setupNavigationSubscriptions()

    /// Cancela todas as assinaturas ativas relacionadas à navegação.
    func cancelNavigationSubscriptions()
}

public extension NavigationSubscriber {
    func cancelNavigationSubscriptions() {
        navigationBag.forEach { $0.cancel() }
        navigationBag.removeAll()
    }
}
