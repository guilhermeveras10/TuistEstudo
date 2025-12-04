import Combine
import SwiftUI

/// Protocolo para ViewModels que precisam gerenciar ciclo de vida.
public protocol LifecycleViewModel: ObservableObject {
    func onAppear()
    func onDisappear()
}

/// `BaseView` que gerencia automaticamente o ciclo de vida de uma `ViewModel`.
public struct BaseView<Content: View, ViewModel: LifecycleViewModel>: View {
    @ObservedObject public var viewModel: ViewModel
    public let content: (ViewModel) -> Content

    public init(
        viewModel: ViewModel,
        @ViewBuilder content: @escaping (ViewModel) -> Content
    ) {
        self.viewModel = viewModel
        self.content = content
    }

    public var body: some View {
        content(viewModel)
            .onAppear {
                viewModel.onAppear()
            }
            .onDisappear {
                viewModel.onDisappear()
            }
    }
}
