import SwiftUI

public class AnimeViewState: ObservableObject {
    @Published var animeName: String

    init(
        animeName: String
    ) {
        self.animeName = animeName
    }
}
