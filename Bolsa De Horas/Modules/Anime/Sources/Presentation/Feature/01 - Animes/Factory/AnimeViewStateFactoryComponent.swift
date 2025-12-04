import NeedleFoundation

public protocol AnimeViewStateFactoryBuilder {
    var factory: AnimesViewStateFactory { get }
}

public protocol AnimeViewStateFactoryDependency: Dependency {}

public class AnimeViewStateFactoryComponent:
    Component<AnimeViewStateFactoryDependency>,
    AnimeViewStateFactoryBuilder
{
    public var factory: AnimesViewStateFactory {
        AnimesViewStateFactory()
    }
}
