import SwiftUI

extension AnimesView {
    func errorState() -> some View {
        VStack(spacing: 12) {
            Text("Ocorreu um erro ao carregar os animes.")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            Button("Tentar novamente") {
                // Reaproveita o ciclo de vida: onAppear chama loadAnimes()
                // Para forçar um novo carregamento, podemos simular uma reaparição:
                // Alternativamente, você pode expor um método `reload()` no ViewModel.
                viewModel.onAppear()
            }
        }
        .padding()
    }
}
