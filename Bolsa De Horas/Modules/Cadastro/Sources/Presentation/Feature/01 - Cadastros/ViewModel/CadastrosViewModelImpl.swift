import Foundation
import Combine

public final class CadastrosViewModelImpl: CadastrosViewModel {
    // MARK: - Properties required by CadastrosViewModel
    
    @Published var readyViewState: [CadastrosViewState]?
    @Published var state: State = .LOADING
    
    // MARK: - Private Properties
    
    private let apiCadastroUseCase: APICadastroUseCase
    private let cadastroViewStateFactory: CadastrosViewStateFactory
    private let navigate: PassthroughSubject<CadastroNavigate, Never>
    private var cancellables: Set<AnyCancellable> = []
    private let flowModel: CadastroFlowModel
    
    private var cadastros: [Cadastro]?

    public init(
        navigate: PassthroughSubject<CadastroNavigate, Never>,
        apiCadastroUseCase: APICadastroUseCase,
        cadastroViewStateFactory: CadastrosViewStateFactory,
        flowModel: CadastroFlowModel
    ) {
        self.navigate = navigate
        self.apiCadastroUseCase = apiCadastroUseCase
        self.cadastroViewStateFactory = cadastroViewStateFactory
        self.flowModel = flowModel
    }

    // MARK: - LifecycleViewModel
    
    public func onAppear() {
        loadCadastros()
    }
    
    public func onDisappear() {
        // Add cleanup if needed
    }
    
    // MARK: - CadastrosViewModel actions
    
    func back() {
        navigate.send(.goBack)
    }
    
    func close() {
        navigate.send(.dismiss)
    }
    
    func openURL(_ deepLink: String) {
        guard let url = URL(string: deepLink) else { return }
        navigate.send(.navigateToModule(url))
    }
    
    // MARK: - Private
    
    private func loadCadastros() {
        state = .LOADING
        apiCadastroUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self else { return }
                if case .failure = completion {
                    self.state = .ERROR
                }
            } receiveValue: { [weak self] page in
                guard let self else { return }
                self.cadastros = page.cadastros
                self.loadstate()
            }
            .store(in: &cancellables)
    }
    
    private func loadstate() {
        guard let cadastros = cadastros else { return }
        readyViewState = cadastroViewStateFactory.create(cadastros: cadastros)
        state = .READY
    }
}
