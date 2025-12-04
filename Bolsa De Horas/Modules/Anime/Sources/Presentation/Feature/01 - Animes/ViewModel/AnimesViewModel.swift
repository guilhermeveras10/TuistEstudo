import Utility

protocol AnimesViewModel: LifecycleViewModel {
    var readyViewState: [AnimesViewState]? { get }
    var state: AnimesViewModelImpl.State { get }
    
    func back()
    func close()
    func openURL(_ deepLink: String)
}
