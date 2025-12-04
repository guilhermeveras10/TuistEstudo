import NeedleFoundation

public protocol CadastroViewStateFactoryBuilder {
    var factory: CadastrosViewStateFactory { get }
}

public protocol CadastroViewStateFactoryDependency: Dependency {}

public class CadastroViewStateFactoryComponent:
    Component<CadastroViewStateFactoryDependency>,
    CadastroViewStateFactoryBuilder
{
    public var factory: CadastrosViewStateFactory {
        CadastrosViewStateFactory()
    }
}
