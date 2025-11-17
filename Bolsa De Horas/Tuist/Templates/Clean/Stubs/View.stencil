import SwiftUI

public struct GenericView: View {
    @StateObject private var viewModel: ViewModel

    public init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        VStack(spacing: 16) {
            TextField("Entrada genérica", text: $viewModel.inputText)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.none)
                // TODO: substituir nomes de campos conforme necessário

            Button("Executar", action: viewModel.onAction)
                .buttonStyle(.borderedProminent)
                .disabled(isLoading)
                // TODO: ajustar ação/botão conforme caso de uso

            statusView

            Spacer()
        }
        .padding()
    }

    private var statusView: some View {
        switch viewModel.state {
        case .idle:
            return Text("Pronto").foregroundColor(.secondary).eraseToAnyView()
        case .loading:
            return ProgressView().eraseToAnyView()
        case .success:
            return Text("Sucesso!").foregroundColor(.green).eraseToAnyView()
        case .error(let message):
            return Text(message).foregroundColor(.red).eraseToAnyView()
        }
    }

    private var isLoading: Bool {
        if case .loading = viewModel.state { return true }
        return false
    }
}

private extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
