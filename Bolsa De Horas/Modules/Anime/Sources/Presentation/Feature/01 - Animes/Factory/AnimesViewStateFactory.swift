import SwiftUI

public class AnimesViewStateFactory {
    public init() {}

    public func create(
        animes: [Anime]
    ) -> [AnimesViewState] {
        animes.map {
            return AnimesViewState(animeName: $0.title)
        }
    }
}
