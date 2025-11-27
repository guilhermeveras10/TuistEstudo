import Foundation
import Combine
import AgiNetwork

public final class NovoModulo2RepositoryImpl: NovoModulo2RepositoryProtocol {
    private var store: [NovoModulo2DTO] = []
    private let mapper = NovoModulo2Mapper()

    public init() {}

    public func getNovoModulo2() -> GetNovoModulo2Return {
        // TODO: substituir por chamada real de rede
        let dto = store.first
        let model = mapper.map(dto)
        return Just(model)
            .setFailureType(to: NetworkAPIError.self)
            .eraseToAnyPublisher()
    }
}
