import AgiNetwork
import Combine

public typealias GetNetworkReturn = AnyPublisher<Network, NetworkAPIError>

// MARK: NetworkRepositoryProtocol - adicione mais funções conforme necessário
public protocol NetworkRepositoryProtocol {
    func getNetwork() -> GetNetworkReturn
}
