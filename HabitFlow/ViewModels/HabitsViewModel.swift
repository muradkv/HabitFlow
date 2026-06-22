//
//  HabitsViewModel.swift
//  HabitFlow
//
//  Created by murad on 20.06.2026.
//

import SwiftUI

@Observable
final class HabitsViewModel {
    var items: [HabitItem] = [] {
        didSet {
            save()
        }
    }
    
    private let saveKey = "SavedHabits"
    
    init() {
        if let savedData = UserDefaults.standard.data(forKey: saveKey) {
            if let decodedItems = try? JSONDecoder().decode([HabitItem].self, from: savedData) {
                self.items = decodedItems
                return
            }
        }
        self.items = []
    }
    
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
    
    func findHabit(id: UUID) -> HabitItem {
        items.first(where: { $0.id == id }) ?? HabitItem(title: "Error", description: "Not Found")
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
}

