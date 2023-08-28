//
//  Habits.swift
//  HabitRabbit
//
//  Created by Susannah Skyer Gupta on 8/28/23.
//

import Foundation

class Habits: ObservableObject {
  @Published var items = [Habit]() {
    didSet {
      let encoder = JSONEncoder()

      if let encoded = try? encoder.encode(items) {
        UserDefaults.standard.set(encoded, forKey: "Habits")
      }
    }
  }
}
