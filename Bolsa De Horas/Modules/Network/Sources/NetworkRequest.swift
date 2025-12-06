import Foundation

public struct NetworkRequest {
    public let url: URL
    public let method: HTTPMethod
    public let headers: [String: String]
    public let queryItems: [String: String]
    public let body: Data?

    public init(
        url: URL,
        method: HTTPMethod = .get,
        headers: [String: String] = [:],
        queryItems: [String: String] = [:],
        body: Data? = nil
    ) {
        self.url = url
        self.method = method
        self.headers = headers
        self.queryItems = queryItems
        self.body = body
    }
}
