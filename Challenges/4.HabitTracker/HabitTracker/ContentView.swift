//
//  ContentView.swift
//  HabitTracker
//
//  Created by Phil Seißelberg on 22.06.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var activityStore = ActivityStore()
    @State private var showAddScreen = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(activityStore.activities) { activity in
                    NavigationLink {
                        ActivityDetailView(activityStore: activityStore, activity: activity)
                    } label: {
                        HabitRowView(title: activity.title, description: activity.description, count: activity.completed.count)
                    }
                }
                .onDelete { indexSet in
                    activityStore.activities.remove(atOffsets: indexSet)
                }
            }
            .overlay {
                if activityStore.activities.isEmpty {
                    ContentUnavailableView("No Habit tracked yet!", systemImage: "trophy")
                }
            }
            .navigationTitle("HabitTracker")
            .toolbar {
                Button {
                    showAddScreen = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddScreen) {
                AddActivityView(activityStore: activityStore)
            }
        }
    }
}

#Preview {
    ContentView()
}
