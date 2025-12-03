import NeedleFoundation

public protocol AnimesFactoryBuilder {
    var viewModel: ViewModel { get }
}

public protocol AnimesFactoryDependency: Dependency {
    var useCase: AnimesUseCaseProtocol { get }
}

public final class AnimesFactoryComponent:
    Component<AnimesFactoryDependency>,
    AnimesFactoryBuilder
{
    public var viewModel: ViewModel {
        ViewModel(useCase: dependency.useCase)
    }
}
