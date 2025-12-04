import Foundation

/// Metadados de paginação da resposta de cadastros.
public struct MetaDTO: Decodable {
    public let page: Int?
    public let size: Int?
    public let totalData: Int?
    public let totalPage: Int?
}
