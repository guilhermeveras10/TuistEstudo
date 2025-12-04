import Utility
import SwiftUI

struct CadastrosView<T: CadastrosViewModel>: View {
    @StateObject var viewModel: T

    var body: some View {
        BaseView(viewModel: viewModel) { viewModel in
            switch viewModel.state {
            case .LOADING:
                loadingState()
            case .READY:
                readyState()
            case .ERROR:
                errorState()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground).ignoresSafeArea())
    }
}
