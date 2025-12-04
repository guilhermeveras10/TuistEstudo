import Combine

open class BaseViewModel: ObservableObject {
    public var cancellables = Set<AnyCancellable>()

    public init() {}

    open func onAppear() {}

    open func onDisappear() {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
        print("All subscriptions cancelled and cleared in \(type(of: self)).")
    }

    deinit {
        print("BaseViewModel deallocated: \(type(of: self))")
    }
}
