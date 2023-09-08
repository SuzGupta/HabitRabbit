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

  let gradient = LinearGradient(gradient: Gradient(colors: [Color("Primary"), .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
  var body: some View {
    NavigationView {
      ZStack {
        Color("NeutralBase")
          .ignoresSafeArea()
        RoundedRectangle(cornerRadius: 10)
          .fill(gradient)
          .padding()
        VStack {
          TextField("Name your habit", text: $name)
            .textFieldStyle(.roundedBorder)
            .foregroundColor(Color("Secondary")).opacity(0.9)
          TextField("Share a little more about it", text: $description)
            .textFieldStyle(.roundedBorder)
            .foregroundColor(Color("Secondary").opacity(0.9))
            .padding()
            Image("PinkCanDoRabbit")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180)
            .clipShape(Circle())
            .shadow(radius: 6)
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
