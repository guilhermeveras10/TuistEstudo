import NeedleFoundation

public protocol AnimeViewBuilder {
    var animesView: AnimesViewBuilder {
        get
    }
}

public protocol AnimeViewDependency: Dependency {}

public final class AnimeViewComponent:
    Component<AnimeViewDependency>,
    AnimeViewBuilder
{
    public var animesView: AnimesViewBuilder {
        AnimesViewComponent(parent: self)
    }
}
