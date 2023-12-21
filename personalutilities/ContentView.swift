import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      HomeView()
        .tabItem { 
          Label("Home", systemImage: "house")
        }
      WalletView()
        .tabItem {
          Label("Passes", systemImage: "wallet.pass")
        }
    }
  }
}

#Preview {
  ContentView()
}
