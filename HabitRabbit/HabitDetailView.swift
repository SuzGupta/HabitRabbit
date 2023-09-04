//
//  HabitDetailView.swift
//  HabitRabbit
//
//  Created by Susannah Skyer Gupta on 9/1/23.
//

import SwiftUI

struct HabitDetailView: View {
  @Binding var habit: Habit

  var gradient: LinearGradient {
    LinearGradient(gradient: Gradient(colors: [.purple,.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
  }
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 25)
        .fill(gradient)
        .padding()
      VStack(spacing: 20) {
        Text("\(habit.name)")
          .font(.title)
          .foregroundColor(.white)
        Text(habit.amount == 1 ? "\(habit.amount) Day So Far! 💪" : "\(habit.amount) Days So Far! 💪")
          .font(.headline)
          .fontWeight(.bold)
          .foregroundColor(.white)
        Text("\(habit.description)")
          .font(.subheadline)
          .foregroundColor(.white)
        Stepper("Count: \(habit.amount)", value: $habit.amount)
          .labelsHidden()
          .background()
          .opacity(0.7)
          .cornerRadius(8)
        // why aren't the stepper controls white?
          .padding(.horizontal, 110)
      }
    }
  }
}

struct HabitDetailView_Previews: PreviewProvider {
  static var sampleHabit = Habit(name: "Sample Habit", description: "This is a sample habit for preview purposes.", amount: 5)

  static var previews: some View {
    HabitDetailView(habit: .constant(sampleHabit))
  }
}
