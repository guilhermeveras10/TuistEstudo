import Foundation

/// Representa a resposta paginada de animes.
public struct AnimeListDTO: Decodable {
    public let data: [AnimeDTO]?
    public let meta: MetaDTO?
}
