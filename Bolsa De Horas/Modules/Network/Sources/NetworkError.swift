import Foundation

public enum NetworkError: Error {
    case invalidRequest
    case invalidResponse
    case statusCode(Int)
    case decoding(DecodingError)
    case requestFailed(Error)
}
