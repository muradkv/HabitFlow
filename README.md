# HabitFlow

![Swift](https://img.shields.io/badge/Swift-5.0+-FA7343?logo=swift&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-18.0+-000000?logo=apple&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-16.0+-147EFB?logo=xcode&logoColor=white)
![Framework](https://img.shields.io/badge/Framework-SwiftUI-007AFF)
![Architecture](https://img.shields.io/badge/Architecture-MVVM-8A2BE2)

A clean, high-performance iOS activity and milestone logging application built natively with SwiftUI. 

HabitFlow shifts away from high-maintenance daily tracking, positioning itself as a long-term consistency companion. Users establish custom, persistent goals and accumulate ongoing repetition milestones—whether logging workouts, water glasses consumed, or books finished—with fluent interactions and zero barrier to entry.

## Preview

<img width="24%" alt="Empty" src="https://github.com/user-attachments/assets/77c4993e-eafd-40fe-8f6e-b980dbab7e2f" />
<img width="24%" alt="ListHabit" src="https://github.com/user-attachments/assets/fd9ef8c7-6840-40ea-a128-d1300ea8ba94" />
<img width="24%" alt="DetailHabit" src="https://github.com/user-attachments/assets/e63ce610-3678-4d5a-9105-2e6574e8782f" />
<img width="24%" alt="AddHabit" src="https://github.com/user-attachments/assets/e04c4ed2-4ec0-4232-97a9-c3e17ea82ab4" />

## Features

* **Milestone Accumulation Engine:** A flexible repetition logger built to track long-term persistent goals over an infinite timeline, accommodating multiple completions per day.
* **Smart Fallback States:** Integrates a localized `ContentUnavailableView` inside a unified `ZStack` layout to deliver a native empty-state fallback when zero entries are loaded.
* **Tactile Interactions:** Utilizes `UIImpactFeedbackGenerator` engines embedded inside completion buttons to enrich the digital interface with crisp, satisfying physical haptic feedback.
* **Persistent Cache Sync:** Driven by property observers that seamlessly serialize, encode, and commit user profiles directly to the sandbox disk on every modification.

## About the Project & Challenge

This application was originally developed to fulfill **Project 9 (Milestone Challenge Days 47-48)** of the *100 Days of SwiftUI* learning path by Paul Hudson (Hacking with Swift). The core educational requirement was to build a multi-screen tracker combining navigation patterns, subview states, and persistent local data storage.

To showcase clean engineering, the entire application was designed from scratch using commercial-grade **MVVM** architectures and production-level clean code practices:

* **Modern Programmatic Routing:** Eradicated memory-heavy eager `NavigationLink(destination:)` initialization loops. Implemented modern type-safe, data-driven routing utilizing `NavigationLink(value:)` paired with a centralized `.navigationDestination(for: UUID.self)` modifier, guaranteeing that detail views are lazily instantiated strictly upon a physical touch event.
* **Modern Observation Engine:** Migrated entirely from the legacy Combine-based `ObservableObject` protocol to the performance-optimized iOS 17 `@Observable` macro macro-system, decreasing memory footprints and preventing unnecessary UI graph re-renders.
* **Clean Separation of Concerns:** Refactored the core views using strict **Dumb Views** patterns. Moved lookup mutations out of the UI layers into an encapsulated `findHabit(id:)` method inside the ViewModel, leaving views strictly responsible for presentation layout.
* **First-Class Function Mapping:** Leveraged Swift function pointers within list contexts (e.g., passing `viewModel.deleteHabit` signatures directly into parameters) to strip away redundant inline syntax wrappers and reduce codebase noise.

🔗 **[Full project challenge description here](https://www.hackingwithswift.com/100/swiftui/47)**

## Project Versioning & Changelog

* **v1.0.0 (Functional MVP & Row Decomposition)**
  Initial baseline release achieving 100% feature completeness. Implements granular model encapsulation, `@Observable` state engines with parent-to-child reference injection, structural JSON `Codable` serialization layers over `UserDefaults`, explicit row card extraction via `HabitRowView`, and high-performance lazy data-driven routing blocks.
