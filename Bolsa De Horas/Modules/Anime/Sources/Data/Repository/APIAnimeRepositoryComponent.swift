import Foundation
import NeedleFoundation
import Alamofire

public protocol APIAnimeRepositoryBuilder {
    var repository: AnimeRepositoryProtocol { get }
}

public protocol APIAnimeRepositoryDependency: Dependency {
    var api: Session { get }
}

public final class APIAnimeRepositoryComponent:
    Component<APIAnimeRepositoryDependency>,
    APIAnimeRepositoryBuilder
{
    public var repository: AnimeRepositoryProtocol {
        APIAnimeRepositoryImpl(api: dependency.api)
    }
}
