//
//  ContentView.swift
//  HabitFlow
//
//  Created by murad on 20.06.2026.
//

import SwiftUI

struct HabitsListView: View {
    @State private var viewModel = HabitsViewModel()
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.items) { habit in
                    VStack(alignment: .leading) {
                        Text(habit.title)
                            .font(.headline)
                        Text(habit.description)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
                .onDelete { offsets in
                    viewModel.deleteHabit(at: offsets)
                }
            }
            .navigationTitle("HabitFlow")
            .toolbar {
                Button {
                    showingAddHabit = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            
            .sheet(isPresented: $showingAddHabit) {
                Text("Add Habit Form Placeholder")
            }
        }
    }
}

#Preview {
    HabitsListView()
}
