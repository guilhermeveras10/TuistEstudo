import Foundation
import Utility

/// Converte a resposta paginada em modelos de dominio usando helpers de defaults.
final class AnimePageMapper: Mapper {

    typealias Input = AnimeListDTO
    typealias Output = AnimePage

    static func map(input: AnimeListDTO?) -> AnimePage {
        guard let dto = input, let meta = dto.meta else {
            return .init(animes: [], page: 0, size: 0, totalData: 0, totalPage: 0)
        }

        let animes = (dto.data ?? []).map { AnimeMapper.map(input: $0) }

        return .init(
            animes: animes,
            page: meta.page.orZero,
            size: meta.size.orZero,
            totalData: meta.totalData.orZero,
            totalPage: meta.totalPage.orZero
        )
    }
}
