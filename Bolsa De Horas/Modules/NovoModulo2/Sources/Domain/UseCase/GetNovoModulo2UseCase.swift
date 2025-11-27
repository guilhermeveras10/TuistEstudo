import Foundation
import Combine

public final class GetNovoModulo2UseCase: NovoModulo2UseCaseProtocol {
    private let repository: NovoModulo2RepositoryProtocol

    public init(repository: NovoModulo2RepositoryProtocol) {
        self.repository = repository
    }

    public func execute() -> GetNovoModulo2Return {
        repository.getNovoModulo2()
            .map { $0 }
            .eraseToAnyPublisher()
    }
}
