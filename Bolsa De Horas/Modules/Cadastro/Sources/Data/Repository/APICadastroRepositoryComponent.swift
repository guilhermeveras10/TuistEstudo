import Foundation
import NeedleFoundation
import Alamofire

public protocol APICadastroRepositoryBuilder {
    var repository: CadastroRepositoryProtocol { get }
}

public protocol APICadastroRepositoryDependency: Dependency {
    var api: Session { get }
}

public final class APICadastroRepositoryComponent:
    Component<APICadastroRepositoryDependency>,
    APICadastroRepositoryBuilder
{
    public var repository: CadastroRepositoryProtocol {
        APICadastroRepositoryImpl(api: dependency.api)
    }
}
