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
  
  @State private var name = "Name your habit, like \"Reading\""
  @State private var description = "Then, say a little more about it"
  @State private var showingAlert = false

  let gradient = LinearGradient(gradient: Gradient(colors: [Color("Primary"), .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
  var body: some View {
    NavigationView {
//      Form {
//        TextField("Name your habit, like Reading", text: $name)
//        TextField("Say a little more about your habit", text: $description)
//
//      }

      ZStack {
        Color("NeutralBase")
          .ignoresSafeArea()
        RoundedRectangle(cornerRadius: 10)
          .fill(gradient)
          .padding()
        VStack {
          TextField("Name", text: $name)
            .textFieldStyle(.roundedBorder)
            .foregroundColor(Color("Secondary")).opacity(0.9)
          TextField("Description", text: $description)
            .textFieldStyle(.roundedBorder)
            .foregroundColor(Color("Secondary").opacity(0.9))
            .padding()
            Image("CanDoRabbit-ideogram")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180)
            .clipShape(Circle())
        }
        .padding(.horizontal, 40)
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
        .tint(Color("Primary"))
      }
      .alert(isPresented: $showingAlert) {
          Alert(title: Text("Whoops"), message: Text("Please fill in a habit name and a description"))
      }
    }
    .background(Color("NeutralBase"))
  }
}

struct AddHabitView_Previews: PreviewProvider {
  static var previews: some View {
    AddHabitView(habits: Habits())
  }
}
