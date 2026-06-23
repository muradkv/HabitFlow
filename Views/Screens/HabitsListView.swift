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
            ZStack {
                List {
                    ForEach(viewModel.items) { habit in
                        NavigationLink(value: habit.id) {
                            HabitRowView(habit: habit)
                        }
                    }
                    .onDelete { offsets in
                        viewModel.deleteHabit(at: offsets)
                    }
                }
                
                if viewModel.items.isEmpty {
                    ContentUnavailableView {
                        Label("No Habits Yet", systemImage: "checklist")
                    } description: {
                        Text("Consistency is the key. Tap the plus button to create your first daily spark.")
                    }
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
                AddHabitView(viewModel: viewModel)
            }
            
            .navigationDestination(for: UUID.self) { id in
                HabitDetailView(habitId: id, viewModel: viewModel)
            }
        }
    }
}

#Preview {
    HabitsListView()
}
