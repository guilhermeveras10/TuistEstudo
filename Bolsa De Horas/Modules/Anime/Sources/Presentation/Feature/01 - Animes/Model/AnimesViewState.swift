import SwiftUI

public class AnimesViewState: ObservableObject {
    @Published var animeName: String

    init(
        animeName: String
    ) {
        self.animeName = animeName
    }
}
