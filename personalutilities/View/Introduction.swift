//
//  Introduction.swift
//  personalutilities
//
//  Created by ike on 23/12/2023.
//

import SwiftUI

struct Introduction: View {
  
  @State private var showingSheet = false
  
  var body: some View {
    Form {
      Section {
        Button {
          showingSheet = true
        } label: {
          Text("Do nothing")
        }
      } footer: {
        Text("Each card in the home panel introduces the functionality that im currently learning.")
      }
      .sheet(isPresented: $showingSheet, content: {
        ZStack {
          VStack {
            Text("sussy baka")
            Button {
              showingSheet = false
            } label: {
              Label("Smile! :)", systemImage: "face.smiling")
            }
            .buttonStyle(.borderedProminent)
          }
        }
          .presentationDetents([.medium])
          .presentationCornerRadius(20)
          .presentationContentInteraction(.scrolls)
          .shadow(radius: 50)
      })
      .navigationTitle("Introduction")
    }
  }
}

#Preview {
  Introduction()
}
