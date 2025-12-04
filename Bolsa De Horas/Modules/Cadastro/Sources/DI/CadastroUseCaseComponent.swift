import NeedleFoundation

public protocol CadastroUseCaseBuilder {
    var apiCadastroUseCaseComponent: APICadastroUseCaseBuilder { get }
}

public protocol CadastroUseCaseDependency: Dependency {}


public final class CadastroUseCaseComponent:
    Component<CadastroUseCaseDependency>,
    CadastroUseCaseBuilder
{
    public var apiCadastroUseCaseComponent: APICadastroUseCaseBuilder {
        APICadastroUseCaseComponent(parent: self)
    }
}
