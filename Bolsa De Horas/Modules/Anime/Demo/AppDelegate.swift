import SwiftUI
import Anime

struct DemoRootView: View {
    var body: some View {
        HomeBuilder.make()
    }
}

struct DemoRootView_Previews: PreviewProvider {
    static var previews: some View {
        DemoRootView()
    }
}
