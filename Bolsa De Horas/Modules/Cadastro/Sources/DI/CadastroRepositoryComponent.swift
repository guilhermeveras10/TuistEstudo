import NeedleFoundation

public protocol CadastroRepositoryBuilder {
    var apiCadastroRepositoryBuilder: APICadastroRepositoryBuilder {
        get
    }
}

public protocol CadastroRepositoryDependency: Dependency {}

public class CadastroRepositoryComponent:
    Component<CadastroRepositoryDependency>,
    CadastroRepositoryBuilder
{
    public var apiCadastroRepositoryBuilder: APICadastroRepositoryBuilder {
        APICadastroRepositoryComponent(parent: self)
    }
}
