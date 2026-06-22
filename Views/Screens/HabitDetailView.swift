//
//  HabitDetailView.swift
//  HabitFlow
//
//  Created by murad on 22.06.2026.
//

import SwiftUI

struct HabitDetailView: View {
    let habitId: UUID
    let viewModel: HabitsViewModel
    
    private var habit: HabitItem {
        viewModel.findHabit(id: habitId)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("ABOUT THIS HABIT")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text(habit.description.isEmpty ? "No description provided." : habit.description)
                        .font(.body)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                VStack(spacing: 12) {
                    Text("Total Completions")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    
                    Text("\(habit.completionCount)")
                        .font(.system(size: 64, weight: .bold, design: .rounded))
                        .foregroundStyle(.tint)
                    
                    Button {
                        let generator = UIImpactFeedbackGenerator(style: .medium)
                        generator.impactOccurred()
                        viewModel.incrementCompletion(for: habit)
                    } label: {
                        Label("Mark as Done", systemImage: "plus.circle.fill")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.tint)
                            .foregroundStyle(.white)
                            .clipShape(Capsule())
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .navigationTitle(habit.title)
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    let previewViewModel = HabitsViewModel()
    let sampleHabit = HabitItem(title: "Drink Water", description: "Drink 2 liters of water daily to stay hydrated")
    previewViewModel.items = [sampleHabit]
    
    return NavigationStack {
        HabitDetailView(habitId: sampleHabit.id, viewModel: previewViewModel)
    }
}
