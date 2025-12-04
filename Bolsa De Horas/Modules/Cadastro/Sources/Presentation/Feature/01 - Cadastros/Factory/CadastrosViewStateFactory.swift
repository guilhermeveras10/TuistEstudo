import SwiftUI

public class CadastrosViewStateFactory {
    public init() {}

    public func create(
        cadastros: [Cadastro]
    ) -> [CadastrosViewState] {
        cadastros.map {
            return CadastrosViewState(cadastroName: $0.title)
        }
    }
}
