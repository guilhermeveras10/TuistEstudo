

import Alamofire
import Combine
import Foundation
import NeedleFoundation
import SwiftUI
import UIKit
import Utility

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class AnimesUseCaseDependency3ebeecd9bee3ec43fb48Provider: AnimesUseCaseDependency {
    var repository: AnimeRepositoryProtocol {
        return animesComponent.repository
    }
    private let animesComponent: AnimesComponent
    init(animesComponent: AnimesComponent) {
        self.animesComponent = animesComponent
    }
}
/// ^->AnimesComponent->AnimesUseCaseComponent
private func factorybae1174ff4c19ebcabb99f39e7593d6cf81390ec(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AnimesUseCaseDependency3ebeecd9bee3ec43fb48Provider(animesComponent: parent1(component) as! AnimesComponent)
}
private class AnimesRepositoryDependency93eaf1cebac6777bed32Provider: AnimesRepositoryDependency {
    var api: Session {
        return animesComponent.api
    }
    private let animesComponent: AnimesComponent
    init(animesComponent: AnimesComponent) {
        self.animesComponent = animesComponent
    }
}
/// ^->AnimesComponent->AnimesRepositoryComponent
private func factoryd2ed1274ff25586839929f39e7593d6cf81390ec(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AnimesRepositoryDependency93eaf1cebac6777bed32Provider(animesComponent: parent1(component) as! AnimesComponent)
}
private class AnimesCoordinatorDependency30c3dcfe4ba276a9d83eProvider: AnimesCoordinatorDependency {
    var navigationController: UINavigationController {
        return animesComponent.navigationController
    }
    var viewComponent: AnimesViewBuilder {
        return animesComponent.viewComponent
    }
    var urlActionHandler: URLActionHandler {
        return animesComponent.urlActionHandler
    }
    private let animesComponent: AnimesComponent
    init(animesComponent: AnimesComponent) {
        self.animesComponent = animesComponent
    }
}
/// ^->AnimesComponent->AnimesCoordinatorComponent
private func factory42266e65540281e488989f39e7593d6cf81390ec(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AnimesCoordinatorDependency30c3dcfe4ba276a9d83eProvider(animesComponent: parent1(component) as! AnimesComponent)
}
private class AnimesViewDependencya3a0b7da50a2147a968aProvider: AnimesViewDependency {
    var viewModel: ViewModel {
        return animesComponent.viewModel
    }
    private let animesComponent: AnimesComponent
    init(animesComponent: AnimesComponent) {
        self.animesComponent = animesComponent
    }
}
/// ^->AnimesComponent->AnimesViewComponent
private func factory3f1f396aac8cb855edba9f39e7593d6cf81390ec(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AnimesViewDependencya3a0b7da50a2147a968aProvider(animesComponent: parent1(component) as! AnimesComponent)
}
private class AnimesFactoryDependency0b2f0ede179e64757658Provider: AnimesFactoryDependency {
    var useCase: AnimesUseCaseProtocol {
        return animesComponent.useCase
    }
    private let animesComponent: AnimesComponent
    init(animesComponent: AnimesComponent) {
        self.animesComponent = animesComponent
    }
}
/// ^->AnimesComponent->AnimesFactoryComponent
private func factory6a6258d3b238d600b9209f39e7593d6cf81390ec(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AnimesFactoryDependency0b2f0ede179e64757658Provider(animesComponent: parent1(component) as! AnimesComponent)
}

#else
extension AnimesUseCaseComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\AnimesUseCaseDependency.repository] = "repository-AnimeRepositoryProtocol"
    }
}
extension AnimesRepositoryComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\AnimesRepositoryDependency.api] = "api-Session"
    }
}
extension AnimesCoordinatorComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\AnimesCoordinatorDependency.navigationController] = "navigationController-UINavigationController"
        keyPathToName[\AnimesCoordinatorDependency.viewComponent] = "viewComponent-AnimesViewBuilder"
        keyPathToName[\AnimesCoordinatorDependency.urlActionHandler] = "urlActionHandler-URLActionHandler"
    }
}
extension AnimesViewComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\AnimesViewDependency.viewModel] = "viewModel-ViewModel"
    }
}
extension AnimesComponent: NeedleFoundation.Registration {
    public func registerItems() {

        localTable["navigationController-UINavigationController"] = { [unowned self] in self.navigationController as Any }
        localTable["navigate-PassthroughSubject<AnimesNavigate, Never>"] = { [unowned self] in self.navigate as Any }
        localTable["api-Session"] = { [unowned self] in self.api as Any }
        localTable["repositoryComponent-AnimesRepositoryBuilder"] = { [unowned self] in self.repositoryComponent as Any }
        localTable["useCaseComponent-AnimesUseCaseBuilder"] = { [unowned self] in self.useCaseComponent as Any }
        localTable["coordinatorComponent-AnimesCoordinatorBuilder"] = { [unowned self] in self.coordinatorComponent as Any }
        localTable["factoryComponent-AnimesFactoryBuilder"] = { [unowned self] in self.factoryComponent as Any }
        localTable["viewComponent-AnimesViewBuilder"] = { [unowned self] in self.viewComponent as Any }
        localTable["repository-AnimeRepositoryProtocol"] = { [unowned self] in self.repository as Any }
        localTable["useCase-AnimesUseCaseProtocol"] = { [unowned self] in self.useCase as Any }
        localTable["viewModel-ViewModel"] = { [unowned self] in self.viewModel as Any }
        localTable["featureView-AnyView"] = { [unowned self] in self.featureView as Any }
        localTable["urlActionHandler-URLActionHandler"] = { [unowned self] in self.urlActionHandler as Any }
        localTable["flowModel-HomeFlowModel"] = { [unowned self] in self.flowModel as Any }
    }
}
extension AnimesFactoryComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\AnimesFactoryDependency.useCase] = "useCase-AnimesUseCaseProtocol"
    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->AnimesComponent->AnimesUseCaseComponent", factorybae1174ff4c19ebcabb99f39e7593d6cf81390ec)
    registerProviderFactory("^->AnimesComponent->AnimesRepositoryComponent", factoryd2ed1274ff25586839929f39e7593d6cf81390ec)
    registerProviderFactory("^->AnimesComponent->AnimesCoordinatorComponent", factory42266e65540281e488989f39e7593d6cf81390ec)
    registerProviderFactory("^->AnimesComponent->AnimesViewComponent", factory3f1f396aac8cb855edba9f39e7593d6cf81390ec)
    registerProviderFactory("^->AnimesComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AnimesComponent->AnimesFactoryComponent", factory6a6258d3b238d600b9209f39e7593d6cf81390ec)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
