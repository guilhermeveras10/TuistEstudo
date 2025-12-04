import SwiftUI

public class CadastrosViewState: ObservableObject {
    @Published var cadastroName: String

    init(
        cadastroName: String
    ) {
        self.cadastroName = cadastroName
    }
}
