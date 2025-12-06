import Combine
import NetworkKit

public typealias GetAnimeReturn = AnyPublisher<AnimePage, NetworkError>

public protocol AnimeRepositoryProtocol {
    func getAnime() -> GetAnimeReturn
}
