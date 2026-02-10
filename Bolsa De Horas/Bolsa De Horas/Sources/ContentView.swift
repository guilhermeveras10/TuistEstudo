import SwiftUI
import Anime
import Utility

public struct ContentView: View {
    @State private var selectedAction: ActionIdentifier?
    @State private var isRegistered = false

    public init() {}

    public var body: some View {
        NavigationView {
            List(ActionIdentifier.allCases, id: \.self) { action in
                Button(action.rawValue) {
                    openDeepLink(for: action)
                }
            }
            .navigationTitle("Módulos")
        }
        .onAppear {
            guard !isRegistered else { return }
            registerDeepLinks()
            isRegistered = true
        }
        .fullScreenCover(item: $selectedAction) { action in
            ModuleHost(action: action)
        }
    }

    private func openDeepLink(for action: ActionIdentifier) {
        let urlString = "myapp://deeplink?action=\(action.rawValue)"
        guard let url = URL(string: urlString) else { return }
        URLActionHandler.shared.handle(url: url)
    }

    private func registerDeepLinks() {
        ActionIdentifier.allCases.forEach { action in
            URLActionHandler.shared.register(action: action.rawValue) { _ in
                DispatchQueue.main.async {
                    selectedAction = action
                }
                return true
            }
        }
    }
}

/// Representa um módulo iniciado via deeplink e exibido em tela cheia.
struct ModuleHost: UIViewControllerRepresentable {
    let action: ActionIdentifier

    func makeUIViewController(context _: Context) -> UIViewController {
        switch action {
        case .actionAnime:
            let module = AnimeModule(
                component: .init()
            )
            let controller = module.startTransition(options: nil)
            controller.modalPresentationStyle = .fullScreen
            controller.view.backgroundColor = .systemBackground
            return controller
        }
    }

    func updateUIViewController(_ uiViewController: UIViewController, context _: Context) {
        uiViewController.view.setNeedsLayout()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
