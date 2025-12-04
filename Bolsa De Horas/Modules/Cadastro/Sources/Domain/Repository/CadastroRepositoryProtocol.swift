import Alamofire
import Combine

public typealias GetCadastroReturn = AnyPublisher<CadastroPage, AFError>

public protocol CadastroRepositoryProtocol {
    func getCadastro() -> GetCadastroReturn
}
