//
//  ContentView.swift
//  iExpense
//
//  Created by Phil Seißelberg on 06.04.24.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    @State private var expenses = Expenses()
    
    var body: some View {
        NavigationStack {
            Group {
                if !expenses.items.isEmpty {
                    List {
                        Section("Personal Expenses") {
                            ForEach(expenses.items) { item in
                                if item.type == "Personal" {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(item.name)
                                                .font(.headline)
                                            Text(item.type)
                                        }
                                        
                                        Spacer()
                                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                            .foregroundStyle(getColor(item.amount))
                                    }
                                }
                            }
                            .onDelete(perform: removeItems)
                        }
                        
                        Section("Buisness Expenses") {
                            ForEach(expenses.items) { item in
                                if item.type == "Buisness" {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(item.name)
                                                .font(.headline)
                                            Text(item.type)
                                        }
                                        
                                        Spacer()
                                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                            .foregroundStyle(getColor(item.amount))
                                    }
                                }
                            }
                            .onDelete(perform: removeItems)
                        }
                    }
                } else {
                    ContentUnavailableView("No expenses tracked yet", systemImage: "dollarsign")
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink {
                    AddView(expenses: expenses)
                } label : {
                    Image(systemName: "plus")
                }
                
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func getColor(_ amount: Double) -> Color {
        if amount < 10 {
            return .red.opacity(0.4)
        } else if amount < 100 {
            return .red.opacity(0.6)
        } else {
            return .red.opacity(0.8)
        }
    }
}

#Preview {
    ContentView()
}
