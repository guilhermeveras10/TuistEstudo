import NeedleFoundation

public protocol AnimeFactoryBuilder {
    var animeViewStateFactoryComponent: AnimeViewStateFactoryBuilder {
        get
    }
}

public protocol AnimeFactoryDependency: Dependency {}

public class AnimeFactoryComponent:
    Component<AnimeFactoryDependency>,
    AnimeFactoryBuilder
{
    public var animeViewStateFactoryComponent: AnimeViewStateFactoryBuilder {
        AnimeViewStateFactoryComponent(parent: self)
    }
}
