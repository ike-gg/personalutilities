import SwiftUI

struct HomeView: View {
  var body: some View {
    NavigationStack {
      VStack {
        NavigationLink(destination: {
          Text("Introduction")
        }, label: {
          ZStack(alignment: .leading) {
            LinearGradient(
              stops: [
                .init(color: .yellow, location: 0),
                .init(color: .orange, location: 0.6),
                .init(color: .red, location: 1)
              ],
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            )
            .scaleEffect(0.95)
            .blur(radius: 20)
            
            LinearGradient(
              stops: [
                .init(color: .yellow, location: 0),
                .init(color: .orange, location: 0.6),
                .init(color: .red, location: 1)
              ],
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            )
            .clipShape(
              RoundedRectangle(cornerRadius: 20)
            )
            VStack(alignment: .leading) {
              Spacer()
              Label(
                "Introduction",
                systemImage: "questionmark.circle"
              ).font(.title)
              Text("Introduction description text lang")
                .font(.footnote)
            }
            .foregroundStyle(.white)
            .padding(20)
          }
          .padding()
          .frame(height: 250)
        })
        
        Spacer()
      }
      .navigationTitle("Home")
    }
  }
}

#Preview {
  HomeView()
}
