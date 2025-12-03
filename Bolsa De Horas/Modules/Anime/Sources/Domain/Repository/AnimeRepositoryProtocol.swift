import Alamofire
import Combine

public typealias GetAnimesReturn = AnyPublisher<AnimePage, AFError>

// MARK: AnimeRepositoryProtocol - adicione mais funções conforme necessário
public protocol AnimeRepositoryProtocol {
    func getAnimes() -> GetAnimesReturn
}
