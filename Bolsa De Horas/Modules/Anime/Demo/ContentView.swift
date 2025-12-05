import SwiftUI
import Anime
import Utility

public struct ContentView: View {
    @State private var showModule = false

    public init() {}

    public var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            VStack(spacing: 24) {
                Text("Demo Anime")
                    .font(.title2)
                Button("Iniciar módulo") {
                    showModule = true
                }
                .buttonStyle(.borderedProminent)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showModule) {
            AnimeModuleContainer()
                .ignoresSafeArea()
        }
    }
}

/// Wrapper SwiftUI para exibir o módulo Anime em tela cheia.
struct AnimeModuleContainer: UIViewControllerRepresentable {
    func makeUIViewController(context _: Context) -> UIViewController {
        let module = AnimeModule(
            component: .init(
                _urlActionHandler: URLActionHandler.shared
            )
        )
        let controller = module.startTransition(options: nil)
        controller.modalPresentationStyle = .fullScreen
        controller.view.backgroundColor = .systemBackground
        controller.view.frame = UIScreen.main.bounds
        return controller
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
