import Combine
import Foundation
import NetworkKit

public final class APIAnimeRepositoryImpl: AnimeRepositoryProtocol {
    private let networkClient: NetworkClientProtocol

    public init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
    }

    public func getAnime() -> GetAnimeReturn {
        guard let url = URL(string: "https://anime-db.p.rapidapi.com/anime") else {
            return Fail(error: NetworkError.invalidRequest).eraseToAnyPublisher()
        }

        let request = NetworkRequest(
            url: url,
            method: .get,
            headers: [
                "x-rapidapi-host": "anime-db.p.rapidapi.com",
                "x-rapidapi-key": "930d940bd9msh4683c46713f75c6p1ae2e6jsn3f61ae5aa5cc"
            ],
            queryItems: [
                "page": "1",
                "size": "10",
                "search": "Fullmetal",
                "genres": "Fantasy,Drama",
                "sortBy": "ranking",
                "sortOrder": "asc"
            ]
        )

        return networkClient
            .request(request)
            .map { dto in AnimePageMapper.map(input: dto) }
            .eraseToAnyPublisher()
    }
}
