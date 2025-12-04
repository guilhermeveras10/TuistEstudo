import SwiftUI

extension AnimesView {
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
