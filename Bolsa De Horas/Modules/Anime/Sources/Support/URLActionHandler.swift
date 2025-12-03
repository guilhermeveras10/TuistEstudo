import Foundation

/// Handler simples para tratar deeplinks/local URLs.
public final class URLActionHandler {
    public static let shared = URLActionHandler()

    private init() {}

    @discardableResult
    public func handle(url: URL) -> Bool {
        // Ajuste aqui a lógica real de deeplink.
        return true
    }
}
