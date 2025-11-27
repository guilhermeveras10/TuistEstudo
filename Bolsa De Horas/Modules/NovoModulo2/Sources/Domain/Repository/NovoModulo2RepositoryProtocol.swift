import AgiNetwork
import Combine

public typealias GetNovoModulo2Return = AnyPublisher<NovoModulo2, NetworkAPIError>

// MARK: NovoModulo2RepositoryProtocol - adicione mais funções conforme necessário
public protocol NovoModulo2RepositoryProtocol {
    func getNovoModulo2() -> GetNovoModulo2Return
}
