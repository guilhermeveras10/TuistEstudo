import Foundation

public struct Network: Equatable {
    public let id: Int
    // TODO: adicionar propriedades de domínio específicas

    public static func == (lhs: Network, rhs: Network) -> Bool {
        lhs.id == rhs.id
    }
}
