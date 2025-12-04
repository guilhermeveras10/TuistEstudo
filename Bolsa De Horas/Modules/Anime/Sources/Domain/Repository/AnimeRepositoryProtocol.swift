import Alamofire
import Combine

public typealias GetAnimeReturn = AnyPublisher<AnimePage, AFError>

public protocol AnimeRepositoryProtocol {
    func getAnime() -> GetAnimeReturn
}
