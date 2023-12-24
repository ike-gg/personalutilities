//
//  File.swift
//  personalutilities
//
//  Created by ike on 23/12/2023.
//

import Foundation

struct BTTVUser: Identifiable, Codable {
  var displayName: String
  var id: String
  var name: String
}

struct BTTVEmote: Identifiable, Codable {
  var animated: Bool
  var code: String
  var id: String
  var user: BTTVUser?
  
  var preview: String {
    animated
    ? "https://cdn.betterttv.net/emote/\(self.id)/3x.gif"
    : "https://cdn.betterttv.net/emote/\(self.id)/3x.png"
  }
}

let DummyBTTVEmote = BTTVEmote(
  animated: false,
  code: "cheJeff",
  id: "57013a408eff3b595e93b79d",
  user: BTTVUser(
    displayName: "Cheoola",
    id: "SH00T1NGST4RS",
    name: "cheoola"
  )
)
