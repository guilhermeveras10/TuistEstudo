import Foundation
import Combine

public final class APIAnimeUseCase {
    private let repository: AnimeRepositoryProtocol

    public init(repository: AnimeRepositoryProtocol) {
        self.repository = repository
    }

    public func execute() -> GetAnimeReturn {
        repository.getAnime()
            .map { $0 }
            .eraseToAnyPublisher()
    }
}
