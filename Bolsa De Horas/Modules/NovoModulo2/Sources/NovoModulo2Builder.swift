import SwiftUI

public enum NovoModulo2Builder {
    public static func make() -> some View {
        let repository = NovoModulo2RepositoryImpl()
        let useCase = GetNovoModulo2UseCase(repository: repository)
        let viewModel = ViewModel(useCase: useCase)
        // TODO: ajustar a montagem conforme dependências reais do módulo
        return GenericView(viewModel: viewModel)
    }
}
