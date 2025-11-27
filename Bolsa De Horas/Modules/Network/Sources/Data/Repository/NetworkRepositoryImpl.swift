import Foundation
import Combine
import AgiNetwork

public final class NetworkRepositoryImpl: NetworkRepositoryProtocol {
    private var store: [NetworkDTO] = []
    private let mapper = NetworkMapper()

    public init() {}

    public func getNetwork() -> GetNetworkReturn {
        // TODO: substituir por chamada real de rede
        let dto = store.first
        let model = mapper.map(dto)
        return Just(model)
            .setFailureType(to: NetworkAPIError.self)
            .eraseToAnyPublisher()
    }
}
