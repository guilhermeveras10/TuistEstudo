import Foundation
import Combine

public final class ViewModel: ObservableObject {
    @Published public var state: ViewState = .idle
    @Published public var inputText: String = ""

    private let useCase: NovoModulo2UseCaseProtocol
    private var cancellables: Set<AnyCancellable> = []

    public init(useCase: NovoModulo2UseCaseProtocol) {
        self.useCase = useCase
    }

    public func onAction() {
        state = .loading
        useCase.execute()
            .sink { completion in
                if case .failure(let error) = completion {
                    state = .error(message: "\(error)")
                }
            } receiveValue: { _ in
                state = .success
            }
            .store(in: &cancellables)
        // TODO: adaptar inputs/outputs conforme o caso de uso
    }
}
