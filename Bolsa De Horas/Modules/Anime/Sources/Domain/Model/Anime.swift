import Foundation

/// Representa um anime no dominio da aplicacao.
public struct Anime: Equatable {
    public let id: String
    public let title: String
    public let genres: [String]
    public let imageURL: URL?
    public let thumbURL: URL?
    public let link: URL?
    public let ranking: Int
    public let score: Double
    public let episodes: Int
    public let status: String
    public let type: String
    public let synopsis: String
    public let alternativeTitles: [String]
    public let hasRanking: Bool
    public let hasEpisode: Bool

    public init(
        id: String,
        title: String,
        genres: [String],
        imageURL: URL?,
        thumbURL: URL?,
        link: URL?,
        ranking: Int,
        score: Double,
        episodes: Int,
        status: String,
        type: String,
        synopsis: String,
        alternativeTitles: [String],
        hasRanking: Bool,
        hasEpisode: Bool
    ) {
        self.id = id
        self.title = title
        self.genres = genres
        self.imageURL = imageURL
        self.thumbURL = thumbURL
        self.link = link
        self.ranking = ranking
        self.score = score
        self.episodes = episodes
        self.status = status
        self.type = type
        self.synopsis = synopsis
        self.alternativeTitles = alternativeTitles
        self.hasRanking = hasRanking
        self.hasEpisode = hasEpisode
    }
}

    /// Estrutura paginada com a lista de animes.
public struct AnimePage: Equatable {
    public let animes: [Anime]
    public let page: Int
    public let size: Int
    public let totalData: Int
    public let totalPage: Int

    public init(
        animes: [Anime],
        page: Int,
        size: Int,
        totalData: Int,
        totalPage: Int
    ) {
        self.animes = animes
        self.page = page
        self.size = size
        self.totalData = totalData
        self.totalPage = totalPage
    }
}
