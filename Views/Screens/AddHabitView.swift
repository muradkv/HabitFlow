//
//  AddHabitView.swift
//  HabitFlow
//
//  Created by murad on 21.06.2026.
//

import SwiftUI

struct AddHabitView: View {
    let viewModel: HabitsViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var title: String = ""
    @State var description: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Habit Title", text: $title)
                TextField("Description (e.g., why, when, details)", text: $description, axis: .vertical)
                    .lineLimit(1...10)
            }
            .navigationTitle("New Habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        viewModel.addHabit(title: title, description: description)
                        dismiss()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
            
        }
    }
}

#Preview {
    let vm = HabitsViewModel()
    AddHabitView(viewModel: vm)
}
