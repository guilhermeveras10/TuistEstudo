import NeedleFoundation
import SwiftUI

public protocol AnimesViewBuilder {
    var featureView: AnyView { get }
}

public protocol AnimesViewDependency: Dependency {
    var viewModel: ViewModel { get }
}

public final class AnimesViewComponent:
    Component<AnimesViewDependency>,
    AnimesViewBuilder
{
    public var featureView: AnyView {
        AnyView(HomeView(viewModel: dependency.viewModel))
    }
}
