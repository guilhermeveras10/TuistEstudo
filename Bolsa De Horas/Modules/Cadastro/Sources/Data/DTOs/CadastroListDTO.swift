import Foundation

/// Representa a resposta paginada de cadastros.
public struct CadastroListDTO: Decodable {
    public let data: [CadastroDTO]?
    public let meta: MetaDTO?
}
