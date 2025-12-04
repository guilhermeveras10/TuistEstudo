import Foundation
import Combine
import Alamofire

public final class APICadastroRepositoryImpl: CadastroRepositoryProtocol {
    private let api: Session

    public init(api: Session) {
        self.api = api
    }

    public func getCadastro() -> GetCadastroReturn {
        let url = "https://cadastro-db.p.rapidapi.com/cadastro"
        let params: Parameters = [
            "page": 1,
            "size": 10,
            "search": "Fullmetal",
            "genres": "Fantasy,Drama",
            "sortBy": "ranking",
            "sortOrder": "asc"
        ]
        let headers: HTTPHeaders = [
            "x-rapidapi-host": "cadastro-db.p.rapidapi.com",
            "x-rapidapi-key": "930d940bd9msh4683c46713f75c6p1ae2e6jsn3f61ae5aa5cc"
        ]

        return api
            .request(
                url,
                method: .get,
                parameters: params,
                encoding: URLEncoding.default,
                headers: headers
            )
            .validate()
            .publishDecodable(type: CadastroListDTO.self)
            .value()
            .map { dto in CadastroPageMapper.map(input: dto) }
            .eraseToAnyPublisher()
    }
}
