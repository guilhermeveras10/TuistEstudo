import Foundation
import Combine

public final class APICadastroUseCase {
    private let repository: CadastroRepositoryProtocol

    public init(repository: CadastroRepositoryProtocol) {
        self.repository = repository
    }

    public func execute() -> GetCadastroReturn {
        repository.getCadastro()
            .map { $0 }
            .eraseToAnyPublisher()
    }
}
