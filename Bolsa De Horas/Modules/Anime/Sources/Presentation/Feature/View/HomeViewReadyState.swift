import SwiftUI

extension HomeView {
    @ViewBuilder
    func readyState(onAction: @escaping () -> Void) -> some View {
        HStack(spacing: 8) {
            Image(systemName: "checkmark.circle")
                .foregroundColor(.green)
            Text("Pronto")
                .foregroundColor(.secondary)
            Spacer()
            Button("Atualizar", action: onAction)
                .buttonStyle(.bordered)
        }
    }
}
