import Foundation
import Combine

public final class AnimesViewModelImpl: AnimesViewModel {
    // MARK: - Properties required by AnimesViewModel
    
    @Published var readyViewState: AnimeViewState?
    @Published var state: State? = .LOADING
    
    // MARK: - Private Properties
    
    private let apiAnimeUseCase: APIAnimeUseCase
    private let animeViewStateFactory: AnimeViewStateFactory
    private let navigate: PassthroughSubject<AnimeNavigate, Never>
    private var cancellables: Set<AnyCancellable> = []
    private let flowModel: AnimeFlowModel
    
    private var animes: [Anime]?

    public init(
        navigate: PassthroughSubject<AnimeNavigate, Never>,
        apiAnimeUseCase: APIAnimeUseCase,
        animeViewStateFactory: AnimeViewStateFactory,
        flowModel: AnimeFlowModel
    ) {
        self.navigate = navigate
        self.apiAnimeUseCase = apiAnimeUseCase
        self.animeViewStateFactory = animeViewStateFactory
        self.flowModel = flowModel
    }

    // MARK: - LifecycleViewModel
    
    public func onAppear() {
        loadAnimes()
    }
    
    public func onDisappear() {
        // Add cleanup if needed
    }
    
    // MARK: - AnimesViewModel actions
    
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
    
    private func loadAnimes() {
        apiAnimeUseCase.execute()
            .sink { [weak self] completion in
                guard let self else { return }
                if case .failure(let error) = completion {
                    self.state = .ERROR
                }
            } receiveValue: { [weak self] page in
                guard let self else { return }
                self.animes = page.animes
                print(self.animes)
            }
            .store(in: &cancellables)
    }
}
