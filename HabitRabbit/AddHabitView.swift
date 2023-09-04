//
//  AddHabitView.swift
//  HabitRabbit
//
//  Created by Susannah Skyer Gupta on 8/28/23.
//

import SwiftUI

struct AddHabitView: View {
  @ObservedObject var habits: Habits
  @Environment(\.dismiss) var dismiss
  
  @State private var name = ""
  @State private var description = ""
  
  //  let types = ["Business", "Personal"]
  
  var body: some View {
    NavigationView {
      Form {
        TextField("Name your habit, like Reading", text: $name)
        TextField("Say a little more about your habit", text: $description)
        
      }
      .navigationTitle("Add a habit")
      .toolbar {
        Button("Save") {
          let habit = Habit(name: name, description: description)
          habits.items.append(habit)
          dismiss()
        }
      }
    }
  }
}

struct AddHabitView_Previews: PreviewProvider {
  static var previews: some View {
    AddHabitView(habits: Habits())
  }
}
