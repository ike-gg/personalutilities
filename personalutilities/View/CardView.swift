//
//  CardView.swift
//  personalutilities
//
//  Created by ike on 22/12/2023.
//

import SwiftUI

struct CardView<Content: View>: View {
  var stops: [Gradient.Stop]
  var content: () -> Content
  
  @State private var isTapping: Bool = false
  
  init(
    stops: [Gradient.Stop],
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.content = content
    self.stops = stops
  }
  
  var body: some View {
    ZStack(alignment: .bottomLeading) {
      LinearGradient(
        stops: self.stops,
        startPoint: .topLeading,
        endPoint: .bottomTrailing
      )
      .scaleEffect(0.95)
      .blur(radius: 20)
      
      LinearGradient(
        stops: self.stops,
        startPoint: .topLeading,
        endPoint: .bottomTrailing
      )
      .clipShape(
        RoundedRectangle(cornerRadius: 20)
      )
      
      VStack(alignment: .leading, content: content)
        .padding(20)
    }
    .frame(height: 200)
    .scaleEffect(isTapping ? 0.95 : 1)
  }
}

#Preview {
  CardView(stops: [.init(color: .blue, location: 0)]) {
    Label("Hello", systemImage: "globe")
  }.foregroundStyle(.white)
}
