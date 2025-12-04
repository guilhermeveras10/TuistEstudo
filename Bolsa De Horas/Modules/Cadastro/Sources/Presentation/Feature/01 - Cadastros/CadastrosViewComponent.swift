import Combine
import NeedleFoundation
import SwiftUI

public protocol CadastrosViewBuilder {
    var view: any View { get }
}

public protocol CadastrosViewDependency: Dependency {
    var navigate: PassthroughSubject<CadastroNavigate, Never> { get }

    var flowModel: CadastroFlowModel { get }

    var useCaseComponent: CadastroUseCaseBuilder {
        get
    }

    var factoryComponent: CadastroFactoryBuilder { get }
}

class CadastrosViewComponent: Component<
CadastrosViewDependency
>,
CadastrosViewBuilder
{
    var view: any View {
        CadastrosView(viewModel: self.viewModel)
    }

    var viewModel: CadastrosViewModelImpl {
        .init(
            navigate: dependency.navigate,
            apiCadastroUseCase: dependency.useCaseComponent.apiCadastroUseCaseComponent.useCase,
            cadastroViewStateFactory: dependency.factoryComponent.cadastroViewStateFactoryComponent.factory,
            flowModel: dependency.flowModel
        )
    }
}
