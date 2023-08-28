//
//  AddHabitView.swift
//  HabitRabbit
//
//  Created by Susannah Skyer Gupta on 8/28/23.
//

import SwiftUI

struct AddHabitView: View {
  //  @ObservedObject var expenses: Expenses
  //  @Environment(\.dismiss) var dismiss
  
  @State private var name = ""
  @State private var description = ""
  
  //  let types = ["Business", "Personal"]
  
  var body: some View {
    NavigationView {
      Form {
        TextField("Name", text: $name)
        TextField("Description", text: $description)
        
      }
      .navigationTitle("Add a habit")
      .toolbar {
        Button("Save") {
          //            let item = ExpenseItem(name: name, type: type, amount: amount)
          //            expenses.items.append(item)
          //            dismiss()
        }
      }
    }
  }
}

struct AddHabitView_Previews: PreviewProvider {
  static var previews: some View {
    AddHabitView()
  }
}
