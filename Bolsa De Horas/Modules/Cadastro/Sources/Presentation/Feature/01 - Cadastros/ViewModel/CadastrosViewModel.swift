import Utility

protocol CadastrosViewModel: LifecycleViewModel {
    var readyViewState: [CadastrosViewState]? { get }
    var state: CadastrosViewModelImpl.State { get }
    
    func back()
    func close()
    func openURL(_ deepLink: String)
}
