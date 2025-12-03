import SwiftUI

extension HomeView {
    @ViewBuilder
    func errorState(message: String, onRetry: @escaping () -> Void) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.orange)
                Text("Ocorreu um erro")
                    .foregroundColor(.primary)
            }
            Text(message)
                .font(.footnote)
                .foregroundColor(.secondary)
                .lineLimit(3)

            Button("Tentar novamente", action: onRetry)
                .buttonStyle(.borderedProminent)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
