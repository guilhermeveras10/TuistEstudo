import SwiftUI

extension CadastrosView {
    func loadingState() -> some View {
        VStack {
            Spacer()
            ProgressView()
                .progressViewStyle(.circular)
            Spacer()
        }
        .padding()
    }
}
