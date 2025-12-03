import NeedleFoundation

public protocol AnimesUseCaseBuilder {
    var useCase: AnimesUseCaseProtocol { get }
}

public protocol AnimesUseCaseDependency: Dependency {
    var repository: AnimeRepositoryProtocol { get }
}

public final class AnimesUseCaseComponent:
    Component<AnimesUseCaseDependency>,
    AnimesUseCaseBuilder
{
    public var useCase: AnimesUseCaseProtocol {
        GetAnimeUseCase(repository: dependency.repository)
    }
}
