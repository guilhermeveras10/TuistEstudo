import NeedleFoundation

public protocol AnimeViewStateFactoryBuilder {
    var factory: AnimeViewStateFactory { get }
}

public protocol AnimeViewStateFactoryDependency: Dependency {}

public class AnimeViewStateFactoryComponent:
    Component<AnimeViewStateFactoryDependency>,
    AnimeViewStateFactoryBuilder
{
    public var factory: AnimeViewStateFactory {
        AnimeViewStateFactory()
    }
}
