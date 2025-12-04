import SwiftUI

extension CadastrosView {
    func errorState() -> some View {
        VStack(spacing: 12) {
            Text("Ocorreu um erro ao carregar os cadastros.")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            Button("Tentar novamente") {
                // Reaproveita o ciclo de vida: onAppear chama loadCadastros()
                // Para forçar um novo carregamento, podemos simular uma reaparição:
                // Alternativamente, você pode expor um método `reload()` no ViewModel.
                viewModel.onAppear()
            }
        }
        .padding()
    }
}
