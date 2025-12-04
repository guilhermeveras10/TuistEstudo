import Foundation
import Utility

/// Converte a resposta paginada em modelos de dominio usando helpers de defaults.
final class CadastroPageMapper: Mapper {

    typealias Input = CadastroListDTO
    typealias Output = CadastroPage

    static func map(input: CadastroListDTO?) -> CadastroPage {
        guard let dto = input, let meta = dto.meta else {
            return .init(cadastros: [], page: 0, size: 0, totalData: 0, totalPage: 0)
        }

        let cadastros = (dto.data ?? []).map { CadastroMapper.map(input: $0) }

        return .init(
            cadastros: cadastros,
            page: meta.page.orZero,
            size: meta.size.orZero,
            totalData: meta.totalData.orZero,
            totalPage: meta.totalPage.orZero
        )
    }
}
