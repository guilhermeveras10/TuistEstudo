import Foundation

public struct NovoModulo2: Equatable {
    public let id: Int
    // TODO: adicionar propriedades de domínio específicas

    public static func == (lhs: NovoModulo2, rhs: NovoModulo2) -> Bool {
        lhs.id == rhs.id
    }
}
