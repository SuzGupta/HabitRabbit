//
//  ContentView.swift
//  HabitRabbit
//
//  Created by Susannah Skyer Gupta on 8/28/23.
//

import SwiftUI

struct ContentView: View {
  @StateObject var habits = Habits()
  @State private var showingAddHabit = false

  var body: some View {
    VStack {
      Text("What habit would you like to track?")
        .padding()
      Button("Add a habit") {
        showingAddHabit = true
      }
    }
    .sheet(isPresented: $showingAddHabit) {
      AddHabitView(habits: habits)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
