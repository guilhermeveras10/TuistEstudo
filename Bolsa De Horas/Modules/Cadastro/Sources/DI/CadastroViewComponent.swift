import NeedleFoundation

public protocol CadastroViewBuilder {
    var cadastrosView: CadastrosViewBuilder {
        get
    }
}

public protocol CadastroViewDependency: Dependency {}

public final class CadastroViewComponent:
    Component<CadastroViewDependency>,
    CadastroViewBuilder
{
    public var cadastrosView: CadastrosViewBuilder {
        CadastrosViewComponent(parent: self)
    }
}
