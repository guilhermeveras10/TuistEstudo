import NeedleFoundation

public protocol APIAnimeUseCaseBuilder {
    var useCase: APIAnimeUseCase { get }
}

public protocol APIAnimeUseCaseDepedency: Dependency {
    var repositoryComponent: AnimeRepositoryBuilder { get }
}

public class APIAnimeUseCaseComponent:
    Component<APIAnimeUseCaseDepedency>,
    APIAnimeUseCaseBuilder
{
    public var useCase: APIAnimeUseCase {
        .init(
            repository: dependency.repositoryComponent
                .apiAnimeRepositoryBuilder.repository
        )
    }
}
