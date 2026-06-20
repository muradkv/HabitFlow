//
//  HabitItem.swift
//  HabitFlow
//
//  Created by murad on 20.06.2026.
//

import Foundation

struct HabitItem: Codable, Identifiable, Equatable {
    let id: UUID
    let title: String
    let description: String
    var completionCount: Int
    
    init(id: UUID = UUID(), title: String, description: String, completionCount: Int = 0) {
        self.id = id
        self.title = title
        self.description = description
        self.completionCount = completionCount
    }
}
