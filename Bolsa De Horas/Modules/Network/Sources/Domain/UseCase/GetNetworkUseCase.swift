import Foundation
import Combine

public final class GetNetworkUseCase: NetworkUseCaseProtocol {
    private let repository: NetworkRepositoryProtocol

    public init(repository: NetworkRepositoryProtocol) {
        self.repository = repository
    }

    public func execute() -> GetNetworkReturn {
        repository.getNetwork()
            .map { $0 }
            .eraseToAnyPublisher()
    }
}
