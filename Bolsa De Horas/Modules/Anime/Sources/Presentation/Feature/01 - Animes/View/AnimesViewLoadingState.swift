import SwiftUI

extension AnimesView {
    @ViewBuilder
    func loadingState() -> some View {
        HStack(spacing: 12) {
            ProgressView()
                .progressViewStyle(.circular)
            Text("Carregando...")
                .foregroundColor(.secondary)
            Spacer()
        }
    }
}
