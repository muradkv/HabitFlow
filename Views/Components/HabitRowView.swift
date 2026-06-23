//
//  HabitRowView.swift
//  HabitFlow
//
//  Created by murad on 23.06.2026.
//

import SwiftUI

struct HabitRowView: View {
    let habit: HabitItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(habit.title)
                    .font(.headline)
                
                if !habit.description.isEmpty {
                    Text(habit.description)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }
            }
            
            Spacer()
            
            Text("\(habit.completionCount)")
                .font(.system(.body, design: .rounded).bold())
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(.tint.opacity(0.1))
                .foregroundStyle(.tint)
                .clipShape(Capsule())
        }
        .padding(.vertical, 2)
    }
}

#Preview {
    let sampleHabit = HabitItem(title: "Drink Water", description: "Drink 2 liters of water daily to stay hydrated")
    
    return HabitRowView(habit: sampleHabit)
}
