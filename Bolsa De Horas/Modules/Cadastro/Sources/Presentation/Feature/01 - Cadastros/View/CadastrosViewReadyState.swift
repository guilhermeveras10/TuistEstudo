import SwiftUI

extension CadastrosView {
    func readyState() -> some View {
        let items = viewModel.readyViewState ?? []
        return List {
            ForEach(items, id: \.cadastroName) { item in
                HStack(spacing: 12) {
                    // Placeholder de thumbnail pode ser adicionado depois
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.cadastroName)
                            .font(.headline)
                            .foregroundColor(.primary)
                    }
                    Spacer()
                }
                .contentShape(Rectangle())
            }
        }
        .listStyle(.plain)
    }
}
