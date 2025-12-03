import Foundation
import Utility

/// Mapeia um DTO de anime para o modelo de dominio.
final class AnimeMapper: Mapper {

    typealias Input = AnimeDTO
    typealias Output = Anime

    static func map(input: AnimeDTO?) -> Anime {
        guard let item = input else { return defaultAnime() }

        let resolvedId = (item.id ?? item._id).orEmpty

        return .init(
            id: resolvedId.isEmpty ? UUID().uuidString : resolvedId,
            title: item.title.orEmpty,
            genres: item.genres ?? [],
            imageURL: URL(string: item.image.orEmpty),
            thumbURL: URL(string: item.thumb.orEmpty),
            link: URL(string: item.link.orEmpty),
            ranking: item.ranking.orZero,
            score: item.score.orZero,
            episodes: item.episodes.orZero,
            status: item.status.orEmpty,
            type: item.type.orEmpty,
            synopsis: item.synopsis.orEmpty,
            alternativeTitles: item.alternativeTitles ?? [],
            hasRanking: item.hasRanking.orFalse,
            hasEpisode: item.hasEpisode.orFalse
        )
    }

    private static func defaultAnime() -> Anime {
        .init(
            id: UUID().uuidString,
            title: "",
            genres: [],
            imageURL: nil,
            thumbURL: nil,
            link: nil,
            ranking: .zero,
            score: .zero,
            episodes: .zero,
            status: "",
            type: "",
            synopsis: "",
            alternativeTitles: [],
            hasRanking: false,
            hasEpisode: false
        )
    }
}
