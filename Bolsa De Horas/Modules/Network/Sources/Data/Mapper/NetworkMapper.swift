import Foundation

class NetworkMapper {
    func map(_ dto: NetworkDTO?) -> Network {
        guard let dto = dto else {
            // TODO: tratar dto nulo conforme a regra do domínio
            return Network(id: 0)
        }

        // TODO: mapear outros campos quando existirem
        return Network(id: dto.id ?? 0)
    }
}
