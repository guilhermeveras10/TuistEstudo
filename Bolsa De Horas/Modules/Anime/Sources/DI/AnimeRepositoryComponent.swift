import NeedleFoundation

public protocol AnimeRepositoryBuilder {
    var apiAnimeRepositoryBuilder: APIAnimeRepositoryBuilder {
        get
    }
}

public protocol AnimeRepositoryDependency: Dependency {}

public class AnimeRepositoryComponent:
    Component<AnimeRepositoryDependency>,
    AnimeRepositoryBuilder
{
    public var apiAnimeRepositoryBuilder: APIAnimeRepositoryBuilder {
        APIAnimeRepositoryComponent(parent: self)
    }
}
