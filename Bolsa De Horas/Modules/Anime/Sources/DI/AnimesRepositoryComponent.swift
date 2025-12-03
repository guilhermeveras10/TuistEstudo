import Foundation
import NeedleFoundation
import Alamofire

public protocol AnimesRepositoryBuilder {
    var repository: AnimeRepositoryProtocol { get }
}

public protocol AnimesRepositoryDependency: Dependency {
    var api: Session { get }
}

public final class AnimesRepositoryComponent:
    Component<AnimesRepositoryDependency>,
    AnimesRepositoryBuilder
{
    public var repository: AnimeRepositoryProtocol {
        AnimeRepositoryImpl(api: dependency.api)
    }
}
