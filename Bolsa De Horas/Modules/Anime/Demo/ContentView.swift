import SwiftUI

struct ContentView: View {
    var startModule: () -> Void

    var body: some View {
        NavigationView {
            List {
                Button(action: {
                    startModule()
                }) {
                    Text("Animes")
                }
            }
            .navigationBarTitle("DEMO", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(startModule: {})
    }
}
