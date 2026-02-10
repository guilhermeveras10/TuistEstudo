import Foundation
import NeedleFoundation
import NetworkKit

public protocol APIAnimeRepositoryBuilder {
    var repository: AnimeRepositoryProtocol { get }
}

public protocol APIAnimeRepositoryDependency: Dependency {
    var networkClient: NetworkClientProtocol { get }
}

public final class APIAnimeRepositoryComponent:
    Component<APIAnimeRepositoryDependency>,
    APIAnimeRepositoryBuilder
{
    public var repository: AnimeRepositoryProtocol {
        APIAnimeRepositoryImpl(networkClient: dependency.networkClient)
    }
}
