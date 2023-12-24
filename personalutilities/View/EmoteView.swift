//
//  EmoteView.swift
//  personalutilities
//
//  Created by ike on 23/12/2023.
//

import SwiftUI

struct EmoteView: View {
  var emote: BTTVEmote
  
  @State private var showingSheet: Bool
  @State private var vibrate: Bool = false
  
  init(_ emote: BTTVEmote, showInitially: Bool = false) {
    self.emote = emote
    self.showingSheet = showInitially
  }
  
  var body: some View {
    Button {
      showingSheet = true
      vibrate.toggle()
    } label: {
      HStack {
        VStack(alignment: .leading) {
          Text(emote.code)
            .font(.headline)
          Text(emote.user?.displayName ?? "")
            .foregroundStyle(.secondary)
            .font(.footnote)
        }
        
        Spacer()
        
        AsyncImage(url: URL(string: emote.preview)) { phase in
          if let image = phase.image {
            image
              .resizable()
              .scaledToFill()
          } else if phase.error != nil {
            Color.blue
          } else {
            ProgressView()
          }
        }
        .frame(width: 50, height: 50)
        .clipShape(
          RoundedRectangle(cornerRadius: 10, style: .circular)
        )
      }
    }
    .sensoryFeedback(.impact, trigger: vibrate)
    .sheet(isPresented: $showingSheet, content: {
      VStack(spacing: 5) {
        Spacer()
        
        AsyncImage(url: URL(string: emote.preview)) { phase in
          if let image = phase.image {
            image
              .resizable()
              .scaledToFill()
          } else if phase.error != nil {
            Color.blue
          } else {
            ProgressView()
          }
        }
        .frame(width: 100, height: 100)
        .padding(20)
        .background(.secondary.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .secondary, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        
        
        Spacer()
        
        VStack(spacing: 5) {
          Text(emote.code).font(.title2)
          Text(emote.id).font(.caption).foregroundStyle(.secondary).fontDesign(.monospaced)
        }
        
        Spacer()
        
        HStack {
          Button {
            print(emote.preview)
          } label: {
            Label("Copy URL", systemImage: "doc.on.doc")
              .frame(maxWidth: .infinity)
          }
          .tint(.gray.opacity(0.1))
          .foregroundStyle(.secondary)
          Button {
            print(emote.preview)
          } label: {
            Label("Edit", systemImage: "pencil")
              .frame(maxWidth: .infinity)
          }
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .padding(.horizontal, 20)
      }
      .presentationDetents([.medium])
    })
  }
}

#Preview {
  Form {
    EmoteView(DummyBTTVEmote, showInitially: true)
  }
}
