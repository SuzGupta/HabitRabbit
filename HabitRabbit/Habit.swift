//
//  Habit.swift
//  HabitRabbit
//
//  Created by Susannah Skyer Gupta on 8/28/23.
//

import Foundation

struct Habit: Identifiable, Codable {
  var id = UUID()
  let name: String
  let description: String
  let amount: Int = 0
}

