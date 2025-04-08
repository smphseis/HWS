//
//  ActivityDetailView.swift
//  HabitTracker
//
//  Created by Phil Seißelberg on 23.06.24.
//

import SwiftUI
import Charts

struct ActivityDetailView: View {
    
    var activityStore: ActivityStore
    var activity: Activity
    
    let columns = Array(repeating: GridItem(), count: 7)
    
    
    var body: some View {
        NavigationStack {
            VStack {
                GroupBox {
                    Text("Total complete times:")
                    HStack {
                        Spacer()
                        Text("\(activity.completed.count)")
                            .font(.largeTitle)
                        Spacer()
                    }
                    HStack {
                        Button {
                            if let index = activityStore.activities.firstIndex(where: { $0.id == activity.id }) {
                                activityStore.activities[index].completed.append(Date.now)
                                print("Done")
                            }
                        } label: {
                            Image(systemName: "plus")
                        }
                        Spacer()
                        Button {
                            if let index = activityStore.activities.firstIndex(where: { $0.id == activity.id }) {
                                if !activityStore.activities[index].completed.isEmpty {
                                    activityStore.activities[index].completed.removeLast()
                                }
                            }
                        } label: {
                            Image(systemName: "minus")
                        }
                    }
                }
                
                
                
                GroupBox {
                    Chart(getCountPerDate()) {
                        BarMark(
                            x: .value("Time", $0.date.formatted()),
                            y: .value("Completed", $0.amount)
                        )
                    }
                }
            }
            .navigationTitle(activity.title)
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    
    func getCountPerDate() -> [CompleteResult] {
        var result = [CompleteResult]()
        
        for completeDate in activity.completed {
            if !(result.compactMap {elem in elem.date }.contains(completeDate)) {
                //neu einfügen
                result.append(CompleteResult(date: completeDate, amount: 1))
            } else {
                //bearbeiten
                if let containedElement = result.first(where: { Calendar.current.isDate($0.date, equalTo: completeDate, toGranularity: .day) }) {
                    var newAmount = containedElement.amount + 1
                    result.removeAll(where: {$0.id == containedElement.id})
                    result.append(CompleteResult(date: completeDate, amount: newAmount))
                }
            }
        }
        
        return result
    }
}

struct CompleteResult: Identifiable {
    var id = UUID()
    var date: Date
    var amount: Int
}

#Preview {
    ActivityDetailView(activityStore: ActivityStore(), activity: Activity(id: UUID(), title: "Learn to code", description: "Just fill the lines!", completed: [.now, .distantFuture, .distantPast ]))
}
