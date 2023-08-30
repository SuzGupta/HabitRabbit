//
//  ContentView.swift
//  HabitRabbit
//
//  Created by Susannah Skyer Gupta on 8/28/23.
//

import SwiftUI
import Foundation

struct ContentView: View {
  @StateObject var habits = Habits()
  @State private var showingAddHabit = false

  var body: some View {
    NavigationView {
      VStack {
        Text("My Habits")
        List {
          ForEach(habits.items) { habit in
            VStack(alignment: .leading) {
              Text(habit.name)
                .font(.headline)
              Text(habit.description)
                .font(.subheadline)
              Text("\(habit.amount)")
                .font(.caption)
            }
          }
        }
        Text("What habit would you like to track?")
          .padding()
        Button("Add a habit") {
          showingAddHabit = true
        }
      }
      .sheet(isPresented: $showingAddHabit) {
        AddHabitView(habits: habits)
      }
      .navigationTitle("Habit Rabbit 🐰")
    }
  }
}

  struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
  }
