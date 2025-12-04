import Foundation
import Combine

public final class GetAnimeUseCase: AnimesUseCaseProtocol {
    private let repository: AnimeRepositoryProtocol

    public init(repository: AnimeRepositoryProtocol) {
        self.repository = repository
    }

    public func execute() -> GetAnimesReturn {
        repository.getAnimes()
            .map { $0 }
            .eraseToAnyPublisher()
    }
}
