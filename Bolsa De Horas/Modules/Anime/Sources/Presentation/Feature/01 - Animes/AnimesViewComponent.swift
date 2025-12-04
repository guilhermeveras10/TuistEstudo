import Combine
import NeedleFoundation
import SwiftUI

public protocol AnimesViewBuilder {
    var view: any View { get }
}

public protocol AnimesViewDependency: Dependency {
    var navigate: PassthroughSubject<AnimeNavigate, Never> { get }

    var flowModel: AnimeFlowModel { get }

    var useCaseComponent: AnimeUseCaseBuilder {
        get
    }

    var factoryComponent: AnimeFactoryBuilder { get }
}

class AnimesViewComponent: Component<
AnimesViewDependency
>,
AnimesViewBuilder
{
    var view: any View {
        AnimesView(viewModel: self.viewModel)
    }

    var viewModel: AnimesViewModelImpl {
        .init(
            navigate: dependency.navigate,
            apiAnimeUseCase: dependency.useCaseComponent.apiAnimeUseCaseComponent.useCase,
            animeViewStateFactory: dependency.factoryComponent.animeViewStateFactoryComponent.factory,
            flowModel: dependency.flowModel
        )
    }
}
