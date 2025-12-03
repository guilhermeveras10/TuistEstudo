import SwiftUI

public enum HomeBuilder {
    public static func make(
        _urlActionHandler: URLActionHandler = .shared,
        flowModel: HomeFlowModel = .init()
    ) -> some View {
        let component = AnimesComponent(_urlActionHandler: _urlActionHandler)
        component.start(_flowModel: flowModel)
        return component.featureView
    }
}
