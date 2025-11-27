import SwiftUI

public enum NetworkBuilder {
    public static func make() -> some View {
        let repository = NetworkRepositoryImpl()
        let useCase = GetNetworkUseCase(repository: repository)
        let viewModel = ViewModel(useCase: useCase)
        // TODO: ajustar a montagem conforme dependências reais do módulo
        return GenericView(viewModel: viewModel)
    }
}
