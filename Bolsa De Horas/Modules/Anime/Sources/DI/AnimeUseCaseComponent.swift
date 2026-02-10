import NeedleFoundation

public protocol AnimeUseCaseBuilder {
    var apiAnimeUseCaseComponent: APIAnimeUseCaseBuilder { get }
}

public protocol AnimeUseCaseDependency: Dependency {}


public final class AnimeUseCaseComponent:
    Component<AnimeUseCaseDependency>,
    AnimeUseCaseBuilder
{
    public var apiAnimeUseCaseComponent: APIAnimeUseCaseBuilder {
        APIAnimeUseCaseComponent(parent: self)
    }
}
