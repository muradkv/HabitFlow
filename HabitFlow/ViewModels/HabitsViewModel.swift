//
//  HabitsViewModel.swift
//  HabitFlow
//
//  Created by murad on 20.06.2026.
//

import SwiftUI

@Observable
final class HabitsViewModel {
    var items: [HabitItem] = []
    
    func addHabit(title: String, description: String) {
        let item = HabitItem(title: title, description: description)
        items.insert(item, at: 0)
    }
    
    func deleteHabit(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    func incrementCompletion(for habit: HabitItem) {
        if let index = items.firstIndex(of: habit) {
            var updatedHabit = items[index]
            updatedHabit.completionCount += 1
            items[index] = updatedHabit
        }
    }
}

