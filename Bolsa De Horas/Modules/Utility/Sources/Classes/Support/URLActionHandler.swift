import Foundation

/// Roteador simples de deeplinks entre módulos.
/// Permite registrar callbacks por host (ex: myapp://anime/...) ou por action (ex: action-anime),
/// chamando o módulo responsável.
public final class URLActionHandler {
    public static let shared = URLActionHandler()

    private let queue = DispatchQueue(label: "com.tuist.urlactionhandler", attributes: .concurrent)
    private var hostHandlers: [String: (URL) -> Bool] = [:]
    private var actionHandlers: [String: (URL) -> Bool] = [:]

    private init() {}

    /// Registra um handler para um host específico (case-insensitive).
    /// Exemplo: `register(host: "anime") { url in animeCoordinator.navigateToFeature(); return true }`
    public func register(host: String, handler: @escaping (URL) -> Bool) {
        let key = host.lowercased()
        queue.async(flags: .barrier) { [weak self] in
            self?.hostHandlers[key] = handler
        }
    }

    /// Registra um handler para uma action específica (ex: "action-anime").
    /// Você pode passar a action via query (?action=action-anime ou ?action:action-anime) ou host (myapp://action-anime/...).
    public func register(action: String, handler: @escaping (URL) -> Bool) {
        let key = action.lowercased()
        queue.async(flags: .barrier) { [weak self] in
            self?.actionHandlers[key] = handler
        }
    }

    /// Remove o handler associado a um host.
    public func unregister(host: String) {
        let key = host.lowercased()
        queue.async(flags: .barrier) { [weak self] in
            self?.hostHandlers.removeValue(forKey: key)
        }
    }

    /// Remove o handler associado a uma action.
    public func unregister(action: String) {
        let key = action.lowercased()
        queue.async(flags: .barrier) { [weak self] in
            self?.actionHandlers.removeValue(forKey: key)
        }
    }

    /// Executa o handler do host, caso exista. Retorna `true` se alguém tratou o deeplink.
    @discardableResult
    public func handle(url: URL) -> Bool {
        let hostKey = (url.host ?? "").lowercased()
        let actionKey = extractAction(from: url)

        var actionHandler: ((URL) -> Bool)?
        var hostHandler: ((URL) -> Bool)?

        queue.sync {
            actionHandler = actionHandlers[actionKey]
            hostHandler = hostHandlers[hostKey]
        }

        if let actionHandler {
            return actionHandler(url)
        }

        if let hostHandler {
            return hostHandler(url)
        }

        return false
    }

    private func extractAction(from url: URL) -> String {
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)

        // 1. Tenta com queryItems padrão (?action=action-anime)
        if let actionItem = components?.queryItems?.first(where: { $0.name.lowercased() == "action" }) {
            if let value = actionItem.value, !value.isEmpty {
                return value.lowercased()
            }
        }

        // 2. Suporta formato não convencional (?action:action-anime)
        if let rawQuery = components?.percentEncodedQuery ?? url.query,
           let inlineAction = extractAction(fromRawQuery: rawQuery) {
            return inlineAction.lowercased()
        }

        // 3. Se não houver query, tenta usar o host diretamente (ex: myapp://action-anime/...)
        return (url.host ?? "").lowercased()
    }

    private func extractAction(fromRawQuery rawQuery: String) -> String? {
        for pair in rawQuery.split(separator: "&") {
            // action=value
            if let value = value(from: pair, separator: "=") {
                return value
            }
            // action:value
            if let value = value(from: pair, separator: ":") {
                return value
            }
        }
        return nil
    }

    private func value(from pair: Substring, separator: Character) -> String? {
        let parts = pair.split(separator: separator, maxSplits: 1)
        guard parts.count == 2 else { return nil }

        let key = parts[0].lowercased()
        let rawValue = String(parts[1])

        guard key == "action", !rawValue.isEmpty else { return nil }

        return rawValue.removingPercentEncoding ?? rawValue
    }
}
