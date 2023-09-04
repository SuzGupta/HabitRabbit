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
  @State private var showingAlert = false
    
  var body: some View {
    NavigationView {
      Form {
        TextField("Name your habit, like Reading", text: $name)
        TextField("Say a little more about your habit", text: $description)
        
      }
      .navigationTitle("Add a habit")
      .toolbar {
        Button("Save") {
          if !name.isEmpty && !description.isEmpty {
            let habit = Habit(name: name, description: description)
            habits.items.append(habit)
            dismiss()
          } else {
            showingAlert = true
          }

        }
      }
      .alert(isPresented: $showingAlert) {
          Alert(title: Text("Whoops"), message: Text("Please fill in a habit name and a description"))
      }
    }
  }
}

struct AddHabitView_Previews: PreviewProvider {
  static var previews: some View {
    AddHabitView(habits: Habits())
  }
}
