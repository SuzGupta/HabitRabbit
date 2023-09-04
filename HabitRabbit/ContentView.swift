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
        if habits.items.isEmpty {
          Spacer()
            .frame(height: 180)
          Image("RabbitForNoHabits-ideogram")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 360)
        }
        List {
          ForEach(habits.items.indices, id:\.self) { index in
            NavigationLink(destination: HabitDetailView(habit: $habits.items[index])) {
              HStack {
                Text(habits.items[index].name)
                  .font(.headline)
                Spacer()
                Text(habits.items[index].amount == 1 ? "\(habits.items[index].amount) Day" : "\(habits.items[index].amount) Days")
                  .font(.headline)
                  .fontWeight(.bold)
              }
            }
          }
          .onDelete(perform: removeItems)
        }

        Text("What habit would you like to track?")
              .padding()
        Button("Add a habit") {
              showingAddHabit = true
            }
        }
      .navigationTitle("Habit Rabbit 🐰")
      }
      .sheet(isPresented: $showingAddHabit) {
      AddHabitView(habits: habits)
      }
      }

  func removeItems(at offsets: IndexSet) {
    self.habits.items.remove(atOffsets: offsets)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
