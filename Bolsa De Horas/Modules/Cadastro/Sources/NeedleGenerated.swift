

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

private func parent2(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class CadastroUseCaseDependency4df1b192e4e1fe6a0b8eProvider: CadastroUseCaseDependency {


    init() {

    }
}
/// ^->CadastroComponent->CadastroUseCaseComponent
private func factory9f002b77d2b5bc5e61ace3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CadastroUseCaseDependency4df1b192e4e1fe6a0b8eProvider()
}
private class CadastroCoordinatorDependency76ee112255951b14a6a2Provider: CadastroCoordinatorDependency {
    var navigationController: UINavigationController {
        return cadastroComponent.navigationController
    }
    var viewComponent: CadastroViewBuilder {
        return cadastroComponent.viewComponent
    }
    var urlActionHandler: URLActionHandler {
        return cadastroComponent.urlActionHandler
    }
    private let cadastroComponent: CadastroComponent
    init(cadastroComponent: CadastroComponent) {
        self.cadastroComponent = cadastroComponent
    }
}
/// ^->CadastroComponent->CadastroCoordinatorComponent
private func factory36302ffe925230e079294d7f802e911e9fcb8711(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CadastroCoordinatorDependency76ee112255951b14a6a2Provider(cadastroComponent: parent1(component) as! CadastroComponent)
}
private class CadastroRepositoryDependency3244bb007086f58655fcProvider: CadastroRepositoryDependency {


    init() {

    }
}
/// ^->CadastroComponent->CadastroRepositoryComponent
private func factory86b0d0f9e97551c1b51ee3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CadastroRepositoryDependency3244bb007086f58655fcProvider()
}
private class CadastroViewDependency7551391fbf296db0c022Provider: CadastroViewDependency {


    init() {

    }
}
/// ^->CadastroComponent->CadastroViewComponent
private func factory09d2102846d01e5e69ffe3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CadastroViewDependency7551391fbf296db0c022Provider()
}
private class CadastroFactoryDependency1cad604a3ed1830e2ac8Provider: CadastroFactoryDependency {


    init() {

    }
}
/// ^->CadastroComponent->CadastroFactoryComponent
private func factoryb46609e9837cb5cb4c84e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CadastroFactoryDependency1cad604a3ed1830e2ac8Provider()
}
private class APICadastroRepositoryDependencya7d0494bcc1e1de9f49cProvider: APICadastroRepositoryDependency {
    var api: Session {
        return cadastroComponent.api
    }
    private let cadastroComponent: CadastroComponent
    init(cadastroComponent: CadastroComponent) {
        self.cadastroComponent = cadastroComponent
    }
}
/// ^->CadastroComponent->CadastroRepositoryComponent->APICadastroRepositoryComponent
private func factorydf6b6cf1bfba1f7c128fc4e254d96ace773c50cd(_ component: NeedleFoundation.Scope) -> AnyObject {
    return APICadastroRepositoryDependencya7d0494bcc1e1de9f49cProvider(cadastroComponent: parent2(component) as! CadastroComponent)
}
private class APICadastroUseCaseDepedency4fdf534ba6787ef3508bProvider: APICadastroUseCaseDepedency {
    var repositoryComponent: CadastroRepositoryBuilder {
        return cadastroComponent.repositoryComponent
    }
    private let cadastroComponent: CadastroComponent
    init(cadastroComponent: CadastroComponent) {
        self.cadastroComponent = cadastroComponent
    }
}
/// ^->CadastroComponent->CadastroUseCaseComponent->APICadastroUseCaseComponent
private func factory6cea10a370229ce276d2c4e254d96ace773c50cd(_ component: NeedleFoundation.Scope) -> AnyObject {
    return APICadastroUseCaseDepedency4fdf534ba6787ef3508bProvider(cadastroComponent: parent2(component) as! CadastroComponent)
}
private class CadastrosViewDependencyc19921abdc82d440994cProvider: CadastrosViewDependency {
    var navigate: PassthroughSubject<CadastroNavigate, Never> {
        return cadastroComponent.navigate
    }
    var flowModel: CadastroFlowModel {
        return cadastroComponent.flowModel
    }
    var useCaseComponent: CadastroUseCaseBuilder {
        return cadastroComponent.useCaseComponent
    }
    var factoryComponent: CadastroFactoryBuilder {
        return cadastroComponent.factoryComponent
    }
    private let cadastroComponent: CadastroComponent
    init(cadastroComponent: CadastroComponent) {
        self.cadastroComponent = cadastroComponent
    }
}
/// ^->CadastroComponent->CadastroViewComponent->CadastrosViewComponent
private func factory5cc29b2ed0c4ce5c41fcc4e254d96ace773c50cd(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CadastrosViewDependencyc19921abdc82d440994cProvider(cadastroComponent: parent2(component) as! CadastroComponent)
}
private class CadastroViewStateFactoryDependencyd629ef91086be545c9f2Provider: CadastroViewStateFactoryDependency {


    init() {

    }
}
/// ^->CadastroComponent->CadastroFactoryComponent->CadastroViewStateFactoryComponent
private func factory621b04e9675c8e027811e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CadastroViewStateFactoryDependencyd629ef91086be545c9f2Provider()
}

#else
extension CadastroUseCaseComponent: NeedleFoundation.Registration {
    public func registerItems() {

        localTable["apiCadastroUseCaseComponent-APICadastroUseCaseBuilder"] = { [unowned self] in self.apiCadastroUseCaseComponent as Any }
    }
}
extension CadastroComponent: NeedleFoundation.Registration {
    public func registerItems() {

        localTable["navigationController-UINavigationController"] = { [unowned self] in self.navigationController as Any }
        localTable["navigate-PassthroughSubject<CadastroNavigate, Never>"] = { [unowned self] in self.navigate as Any }
        localTable["api-Session"] = { [unowned self] in self.api as Any }
        localTable["repositoryComponent-CadastroRepositoryBuilder"] = { [unowned self] in self.repositoryComponent as Any }
        localTable["useCaseComponent-CadastroUseCaseBuilder"] = { [unowned self] in self.useCaseComponent as Any }
        localTable["coordinatorComponent-CadastroCoordinatorBuilder"] = { [unowned self] in self.coordinatorComponent as Any }
        localTable["factoryComponent-CadastroFactoryBuilder"] = { [unowned self] in self.factoryComponent as Any }
        localTable["viewComponent-CadastroViewBuilder"] = { [unowned self] in self.viewComponent as Any }
        localTable["urlActionHandler-URLActionHandler"] = { [unowned self] in self.urlActionHandler as Any }
        localTable["flowModel-CadastroFlowModel"] = { [unowned self] in self.flowModel as Any }
    }
}
extension CadastroCoordinatorComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\CadastroCoordinatorDependency.navigationController] = "navigationController-UINavigationController"
        keyPathToName[\CadastroCoordinatorDependency.viewComponent] = "viewComponent-CadastroViewBuilder"
        keyPathToName[\CadastroCoordinatorDependency.urlActionHandler] = "urlActionHandler-URLActionHandler"
    }
}
extension CadastroRepositoryComponent: NeedleFoundation.Registration {
    public func registerItems() {

        localTable["apiCadastroRepositoryBuilder-APICadastroRepositoryBuilder"] = { [unowned self] in self.apiCadastroRepositoryBuilder as Any }
    }
}
extension CadastroViewComponent: NeedleFoundation.Registration {
    public func registerItems() {

        localTable["cadastrosView-CadastrosViewBuilder"] = { [unowned self] in self.cadastrosView as Any }
    }
}
extension CadastroFactoryComponent: NeedleFoundation.Registration {
    public func registerItems() {

        localTable["cadastroViewStateFactoryComponent-CadastroViewStateFactoryBuilder"] = { [unowned self] in self.cadastroViewStateFactoryComponent as Any }
    }
}
extension APICadastroRepositoryComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\APICadastroRepositoryDependency.api] = "api-Session"
    }
}
extension APICadastroUseCaseComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\APICadastroUseCaseDepedency.repositoryComponent] = "repositoryComponent-CadastroRepositoryBuilder"
    }
}
extension CadastrosViewComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\CadastrosViewDependency.navigate] = "navigate-PassthroughSubject<CadastroNavigate, Never>"
        keyPathToName[\CadastrosViewDependency.flowModel] = "flowModel-CadastroFlowModel"
        keyPathToName[\CadastrosViewDependency.useCaseComponent] = "useCaseComponent-CadastroUseCaseBuilder"
        keyPathToName[\CadastrosViewDependency.factoryComponent] = "factoryComponent-CadastroFactoryBuilder"
    }
}
extension CadastroViewStateFactoryComponent: NeedleFoundation.Registration {
    public func registerItems() {

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
    registerProviderFactory("^->CadastroComponent->CadastroUseCaseComponent", factory9f002b77d2b5bc5e61ace3b0c44298fc1c149afb)
    registerProviderFactory("^->CadastroComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->CadastroComponent->CadastroCoordinatorComponent", factory36302ffe925230e079294d7f802e911e9fcb8711)
    registerProviderFactory("^->CadastroComponent->CadastroRepositoryComponent", factory86b0d0f9e97551c1b51ee3b0c44298fc1c149afb)
    registerProviderFactory("^->CadastroComponent->CadastroViewComponent", factory09d2102846d01e5e69ffe3b0c44298fc1c149afb)
    registerProviderFactory("^->CadastroComponent->CadastroFactoryComponent", factoryb46609e9837cb5cb4c84e3b0c44298fc1c149afb)
    registerProviderFactory("^->CadastroComponent->CadastroRepositoryComponent->APICadastroRepositoryComponent", factorydf6b6cf1bfba1f7c128fc4e254d96ace773c50cd)
    registerProviderFactory("^->CadastroComponent->CadastroUseCaseComponent->APICadastroUseCaseComponent", factory6cea10a370229ce276d2c4e254d96ace773c50cd)
    registerProviderFactory("^->CadastroComponent->CadastroViewComponent->CadastrosViewComponent", factory5cc29b2ed0c4ce5c41fcc4e254d96ace773c50cd)
    registerProviderFactory("^->CadastroComponent->CadastroFactoryComponent->CadastroViewStateFactoryComponent", factory621b04e9675c8e027811e3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
