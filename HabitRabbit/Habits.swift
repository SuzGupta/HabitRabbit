//
//  Habits.swift
//  HabitRabbit
//
//  Created by Susannah Skyer Gupta on 8/28/23.
//

import Foundation

// aha, saving to UserDefaults should live here in the class

class Habits: ObservableObject {
  @Published var items = [Habit]() {
    didSet {
      let encoder = JSONEncoder()

      if let encoded = try? encoder.encode(items) {
        UserDefaults.standard.set(encoded, forKey: "Habits")
      }
    }
  }

  init() {
    if let savedItems = UserDefaults.standard.data(forKey: "Habits") {
      if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedItems) {
        items = decodedItems
        return
      }
    }
    items = []
  }
  
}
