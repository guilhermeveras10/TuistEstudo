import NeedleFoundation

public protocol APIAnimeUseCaseBuilder {
    var useCase: APIAnimeUseCase { get }
}

public protocol APIAnimeUseCaseDepedency: Dependency {
    var repositoryComponent: CreditCardInvoicesV2RepositoryBuilder { get }
}

public class APIAnimeUseCaseComponent:
    Component<APIAnimeUseCaseDepedency>,
    APIAnimeUseCaseBuilder
{
    public var useCase: APIAnimeUseCase {
        .init(
            repository: dependency.repositoryComponent
                .getInvoicesRepositoryComponent.repository
        )
    }
}
