

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

private class AnimeFactoryDependencycd0bd62cbfb2f840de15Provider: AnimeFactoryDependency {


    init() {

    }
}
/// ^->AnimeComponent->AnimeFactoryComponent
private func factoryb379a94379f631f444bee3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AnimeFactoryDependencycd0bd62cbfb2f840de15Provider()
}
private class AnimeCoordinatorDependency6634473ab6096586edceProvider: AnimeCoordinatorDependency {
    var navigationController: UINavigationController {
        return animeComponent.navigationController
    }
    var viewComponent: AnimeViewBuilder {
        return animeComponent.viewComponent
    }
    private let animeComponent: AnimeComponent
    init(animeComponent: AnimeComponent) {
        self.animeComponent = animeComponent
    }
}
/// ^->AnimeComponent->AnimeCoordinatorComponent
private func factoryb95e2c1764ca739286210d7836feb2e2c4f52427(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AnimeCoordinatorDependency6634473ab6096586edceProvider(animeComponent: parent1(component) as! AnimeComponent)
}
private class AnimeRepositoryDependencyda610b8205d6227888dfProvider: AnimeRepositoryDependency {


    init() {

    }
}
/// ^->AnimeComponent->AnimeRepositoryComponent
private func factoryf186d3f01c7cc474cdb7e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AnimeRepositoryDependencyda610b8205d6227888dfProvider()
}
private class AnimeUseCaseDependency0474fcc8e3a7474e4927Provider: AnimeUseCaseDependency {


    init() {

    }
}
/// ^->AnimeComponent->AnimeUseCaseComponent
private func factory21880200fb95be4e6769e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AnimeUseCaseDependency0474fcc8e3a7474e4927Provider()
}
private class AnimeViewDependency5a32d0a46e78e277834aProvider: AnimeViewDependency {


    init() {

    }
}
/// ^->AnimeComponent->AnimeViewComponent
private func factoryd86bd7767d2f06fa085ae3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AnimeViewDependency5a32d0a46e78e277834aProvider()
}
private class APIAnimeRepositoryDependency19f45f7c4ca1e3d62e6dProvider: APIAnimeRepositoryDependency {
    var api: Session {
        return animeComponent.api
    }
    private let animeComponent: AnimeComponent
    init(animeComponent: AnimeComponent) {
        self.animeComponent = animeComponent
    }
}
/// ^->AnimeComponent->AnimeRepositoryComponent->APIAnimeRepositoryComponent
private func factory842215014e4ce5db37acbf8166cfd3e5ad81a09e(_ component: NeedleFoundation.Scope) -> AnyObject {
    return APIAnimeRepositoryDependency19f45f7c4ca1e3d62e6dProvider(animeComponent: parent2(component) as! AnimeComponent)
}
private class APIAnimeUseCaseDepedency10c2d340c3351ac7346eProvider: APIAnimeUseCaseDepedency {
    var repositoryComponent: AnimeRepositoryBuilder {
        return animeComponent.repositoryComponent
    }
    private let animeComponent: AnimeComponent
    init(animeComponent: AnimeComponent) {
        self.animeComponent = animeComponent
    }
}
/// ^->AnimeComponent->AnimeUseCaseComponent->APIAnimeUseCaseComponent
private func factory93d79740802b33054694bf8166cfd3e5ad81a09e(_ component: NeedleFoundation.Scope) -> AnyObject {
    return APIAnimeUseCaseDepedency10c2d340c3351ac7346eProvider(animeComponent: parent2(component) as! AnimeComponent)
}
private class AnimesViewDependency4ee36c5697843bf1a26cProvider: AnimesViewDependency {
    var navigate: PassthroughSubject<AnimeNavigate, Never> {
        return animeComponent.navigate
    }
    var flowModel: AnimeFlowModel {
        return animeComponent.flowModel
    }
    var useCaseComponent: AnimeUseCaseBuilder {
        return animeComponent.useCaseComponent
    }
    var factoryComponent: AnimeFactoryBuilder {
        return animeComponent.factoryComponent
    }
    private let animeComponent: AnimeComponent
    init(animeComponent: AnimeComponent) {
        self.animeComponent = animeComponent
    }
}
/// ^->AnimeComponent->AnimeViewComponent->AnimesViewComponent
private func factory77836debc75b54942a23bf8166cfd3e5ad81a09e(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AnimesViewDependency4ee36c5697843bf1a26cProvider(animeComponent: parent2(component) as! AnimeComponent)
}
private class AnimeViewStateFactoryDependencyb6dafe5018311423470dProvider: AnimeViewStateFactoryDependency {


    init() {

    }
}
/// ^->AnimeComponent->AnimeFactoryComponent->AnimeViewStateFactoryComponent
private func factory564d0feea45e2c79fd60e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AnimeViewStateFactoryDependencyb6dafe5018311423470dProvider()
}

#else
extension AnimeFactoryComponent: NeedleFoundation.Registration {
    public func registerItems() {

        localTable["animeViewStateFactoryComponent-AnimeViewStateFactoryBuilder"] = { [unowned self] in self.animeViewStateFactoryComponent as Any }
    }
}
extension AnimeCoordinatorComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\AnimeCoordinatorDependency.navigationController] = "navigationController-UINavigationController"
        keyPathToName[\AnimeCoordinatorDependency.viewComponent] = "viewComponent-AnimeViewBuilder"
    }
}
extension AnimeComponent: NeedleFoundation.Registration {
    public func registerItems() {

        localTable["navigationController-UINavigationController"] = { [unowned self] in self.navigationController as Any }
        localTable["navigate-PassthroughSubject<AnimeNavigate, Never>"] = { [unowned self] in self.navigate as Any }
        localTable["api-Session"] = { [unowned self] in self.api as Any }
        localTable["repositoryComponent-AnimeRepositoryBuilder"] = { [unowned self] in self.repositoryComponent as Any }
        localTable["useCaseComponent-AnimeUseCaseBuilder"] = { [unowned self] in self.useCaseComponent as Any }
        localTable["coordinatorComponent-AnimeCoordinatorBuilder"] = { [unowned self] in self.coordinatorComponent as Any }
        localTable["factoryComponent-AnimeFactoryBuilder"] = { [unowned self] in self.factoryComponent as Any }
        localTable["viewComponent-AnimeViewBuilder"] = { [unowned self] in self.viewComponent as Any }
        localTable["flowModel-AnimeFlowModel"] = { [unowned self] in self.flowModel as Any }
    }
}
extension AnimeRepositoryComponent: NeedleFoundation.Registration {
    public func registerItems() {

        localTable["apiAnimeRepositoryBuilder-APIAnimeRepositoryBuilder"] = { [unowned self] in self.apiAnimeRepositoryBuilder as Any }
    }
}
extension AnimeUseCaseComponent: NeedleFoundation.Registration {
    public func registerItems() {

        localTable["apiAnimeUseCaseComponent-APIAnimeUseCaseBuilder"] = { [unowned self] in self.apiAnimeUseCaseComponent as Any }
    }
}
extension AnimeViewComponent: NeedleFoundation.Registration {
    public func registerItems() {

        localTable["animesView-AnimesViewBuilder"] = { [unowned self] in self.animesView as Any }
    }
}
extension APIAnimeRepositoryComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\APIAnimeRepositoryDependency.api] = "api-Session"
    }
}
extension APIAnimeUseCaseComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\APIAnimeUseCaseDepedency.repositoryComponent] = "repositoryComponent-AnimeRepositoryBuilder"
    }
}
extension AnimesViewComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\AnimesViewDependency.navigate] = "navigate-PassthroughSubject<AnimeNavigate, Never>"
        keyPathToName[\AnimesViewDependency.flowModel] = "flowModel-AnimeFlowModel"
        keyPathToName[\AnimesViewDependency.useCaseComponent] = "useCaseComponent-AnimeUseCaseBuilder"
        keyPathToName[\AnimesViewDependency.factoryComponent] = "factoryComponent-AnimeFactoryBuilder"
    }
}
extension AnimeViewStateFactoryComponent: NeedleFoundation.Registration {
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
    registerProviderFactory("^->AnimeComponent->AnimeFactoryComponent", factoryb379a94379f631f444bee3b0c44298fc1c149afb)
    registerProviderFactory("^->AnimeComponent->AnimeCoordinatorComponent", factoryb95e2c1764ca739286210d7836feb2e2c4f52427)
    registerProviderFactory("^->AnimeComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AnimeComponent->AnimeRepositoryComponent", factoryf186d3f01c7cc474cdb7e3b0c44298fc1c149afb)
    registerProviderFactory("^->AnimeComponent->AnimeUseCaseComponent", factory21880200fb95be4e6769e3b0c44298fc1c149afb)
    registerProviderFactory("^->AnimeComponent->AnimeViewComponent", factoryd86bd7767d2f06fa085ae3b0c44298fc1c149afb)
    registerProviderFactory("^->AnimeComponent->AnimeRepositoryComponent->APIAnimeRepositoryComponent", factory842215014e4ce5db37acbf8166cfd3e5ad81a09e)
    registerProviderFactory("^->AnimeComponent->AnimeUseCaseComponent->APIAnimeUseCaseComponent", factory93d79740802b33054694bf8166cfd3e5ad81a09e)
    registerProviderFactory("^->AnimeComponent->AnimeViewComponent->AnimesViewComponent", factory77836debc75b54942a23bf8166cfd3e5ad81a09e)
    registerProviderFactory("^->AnimeComponent->AnimeFactoryComponent->AnimeViewStateFactoryComponent", factory564d0feea45e2c79fd60e3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
