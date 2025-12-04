import NeedleFoundation

public protocol APICadastroUseCaseBuilder {
    var useCase: APICadastroUseCase { get }
}

public protocol APICadastroUseCaseDepedency: Dependency {
    var repositoryComponent: CadastroRepositoryBuilder { get }
}

public class APICadastroUseCaseComponent:
    Component<APICadastroUseCaseDepedency>,
    APICadastroUseCaseBuilder
{
    public var useCase: APICadastroUseCase {
        .init(
            repository: dependency.repositoryComponent
                .apiCadastroRepositoryBuilder.repository
        )
    }
}
