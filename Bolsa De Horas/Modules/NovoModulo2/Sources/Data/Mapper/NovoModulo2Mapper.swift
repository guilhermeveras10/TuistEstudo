import Foundation

class NovoModulo2Mapper {
    func map(_ dto: NovoModulo2DTO?) -> NovoModulo2 {
        guard let dto = dto else {
            // TODO: tratar dto nulo conforme a regra do domínio
            return NovoModulo2(id: 0)
        }

        // TODO: mapear outros campos quando existirem
        return NovoModulo2(id: dto.id ?? 0)
    }
}
