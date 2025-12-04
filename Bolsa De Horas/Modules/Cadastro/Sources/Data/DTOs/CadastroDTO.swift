import Foundation

/// DTO principal para itens de cadastro.
public struct CadastroDTO: Decodable {
    public let v: Int?
    public let alternativeTitles: [String]?
    public let genres: [String]?
    public let hasRanking: Bool?
    public let image: String?
    public let link: String?
    public let ranking: Int?
    public let thumb: String?
    public let title: String?
    public let episodes: Int?
    public let hasEpisode: Bool?
    public let status: String?
    public let synopsis: String?
    public let type: String?
    public let updatedAt: String?
    public let workerId: String?
    public let score: Double?
    public let id: String?
    public let _id: String?

    enum CodingKeys: String, CodingKey {
        case v = "__v"
        case alternativeTitles
        case genres
        case hasRanking
        case image
        case link
        case ranking
        case thumb
        case title
        case episodes
        case hasEpisode
        case status
        case synopsis
        case type
        case updatedAt
        case workerId
        case score
        case id
        case _id
    }
}
