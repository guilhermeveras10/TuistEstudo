import NeedleFoundation

public protocol CadastroFactoryBuilder {
    var cadastroViewStateFactoryComponent: CadastroViewStateFactoryBuilder {
        get
    }
}

public protocol CadastroFactoryDependency: Dependency {}

public class CadastroFactoryComponent:
    Component<CadastroFactoryDependency>,
    CadastroFactoryBuilder
{
    public var cadastroViewStateFactoryComponent: CadastroViewStateFactoryBuilder {
        CadastroViewStateFactoryComponent(parent: self)
    }
}
