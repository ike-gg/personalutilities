import SwiftUI

struct HomeView: View {
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 20) {
          NavigationLink(destination: Introduction(), label: {
            CardView(stops: [
              .init(color: .blue.opacity(0.2), location: 0),
              .init(color: .blue.opacity(0.1), location: 1)
            ]) {
              VStack(alignment: .leading, spacing: 5) {
                Image(systemName: "info.circle")
                  .font(.title)
                  .symbolEffect(.bounce, value: 1)
                
                Spacer()
                
                Text("Introduction")
                  .font(.title)
                Text("Distributed object-oriented frame")
              }
            }
          })
          
          NavigationLink(destination: DataFetching(), label: {
            CardView(stops: [
              .init(color: .purple.opacity(0.1), location: 0),
              .init(color: .purple.opacity(0.3), location: 0.8),
            ]) {
              VStack(alignment: .leading, spacing: 5) {
                Image(systemName: "network")
                  .font(.title)
                  .symbolEffect(.bounce, value: 1)
                
                Spacer()
                
                Text("Data fetching")
                  .font(.title)
                Text("Fetching data from some free-shitty API's")
              }
            }
            .foregroundStyle(.purple)
          })
          Spacer()
        }
        .padding(.horizontal)
        .navigationTitle("Home")
        
      }
    }
  }
}

#Preview {
  HomeView()
}
