//
//  AddActivityView.swift
//  HabitTracker
//
//  Created by Phil Seißelberg on 23.06.24.
//

import SwiftUI

struct AddActivityView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var date: Date = .now
    
    var activityStore: ActivityStore
    
    var body: some View {
        NavigationStack {
            Form {
                VStack {
                    TextField("Habit title", text: $title)
                    Divider()
                    TextField("Enter description", text: $description)
                    Divider()
                    DatePicker("Activity Date", selection: $date)
                }
            }
            .toolbar {
                Button("Add habit") {
                    let habit = Activity(id: UUID(), title: title, description: description, completed: [date])
                    activityStore.activities.append(habit)
                    dismiss()
                }
            }
            .navigationTitle("Add new habit")
        }
    }
}

#Preview {
    AddActivityView(activityStore: ActivityStore())
}
