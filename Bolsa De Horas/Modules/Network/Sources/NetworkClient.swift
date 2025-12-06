import Combine
import Foundation

public protocol NetworkClientProtocol {
    func request<T: Decodable>(_ request: NetworkRequest) -> AnyPublisher<T, NetworkError>
}

public final class NetworkClient: NetworkClientProtocol {
    private let session: URLSession
    private let decoder: JSONDecoder

    public init(
        session: URLSession = .shared,
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.session = session
        self.decoder = decoder
    }

    public func request<T: Decodable>(_ request: NetworkRequest) -> AnyPublisher<T, NetworkError> {
        guard var components = URLComponents(
            url: request.url,
            resolvingAgainstBaseURL: false
        ) else {
            return Fail(error: NetworkError.invalidRequest).eraseToAnyPublisher()
        }

        if !request.queryItems.isEmpty {
            var items = components.queryItems ?? []
            let mappedItems = request.queryItems.map {
                URLQueryItem(name: $0.key, value: $0.value)
            }
            items.append(contentsOf: mappedItems)
            components.queryItems = items
        }

        guard let finalURL = components.url else {
            return Fail(error: NetworkError.invalidRequest).eraseToAnyPublisher()
        }

        var urlRequest = URLRequest(url: finalURL)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.httpBody = request.body
        request.headers.forEach { header, value in
            urlRequest.addValue(value, forHTTPHeaderField: header)
        }

        return session
            .dataTaskPublisher(for: urlRequest)
            .mapError { NetworkError.requestFailed($0) }
            .tryMap { output -> Data in
                guard let httpResponse = output.response as? HTTPURLResponse else {
                    throw NetworkError.invalidResponse
                }

                guard (200 ... 299).contains(httpResponse.statusCode) else {
                    throw NetworkError.statusCode(httpResponse.statusCode)
                }

                return output.data
            }
            .decode(type: T.self, decoder: decoder)
            .mapError { error -> NetworkError in
                if let networkError = error as? NetworkError {
                    return networkError
                }

                if let decodingError = error as? DecodingError {
                    return .decoding(decodingError)
                }

                return .requestFailed(error)
            }
            .eraseToAnyPublisher()
    }
}
