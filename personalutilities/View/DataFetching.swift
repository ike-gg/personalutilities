//
//  DataFetching.swift
//  personalutilities
//
//  Created by ike on 23/12/2023.
//

import SwiftUI

enum FetchError: Error, LocalizedError {
  case wrongUrl
  case requestFailed
}

struct DataFetching: View {
  @State private var query = ""
  @State private var emotes: [BTTVEmote] = [DummyBTTVEmote]
  
  func fetchEmotes(query: String) async throws -> [BTTVEmote] {
    guard let url = URL(
      string: "https://api.betterttv.net/3/emotes/shared/search?query=\(query)&offset=0&limit=10"
    ) else {
      print("Invalid URL")
      throw FetchError.wrongUrl
    }
    
    do {
      let (data, _) = try await URLSession.shared.data(from: url)
      let decodedResponse = try JSONDecoder().decode([BTTVEmote].self, from: data)
      
      return decodedResponse
    } catch let error {
      print("Request failed", error)
      throw FetchError.requestFailed
    }
  }
  
  var body: some View {
    List {
      Section {
        TextField("Query emote", text: $query)
      } header: {
        Text("Search for emote")
      }
      
      Section {
        ForEach(emotes, id: \.id) { emote in
          EmoteView(emote)
        }
      }
      
    }
    .sensoryFeedback(.impact, trigger: query)
    .onChange(of: query, { _, newValue in
      Task {
        guard query.count > 3 else {
          return;
        }
        do {
          let emotes = try await fetchEmotes(query: query)
          self.emotes = emotes
        } catch let error {
          print(error)
        }
      }
    })
    .navigationTitle("Data fetching BTTV")
  }
}

#Preview {
  DataFetching()
}
