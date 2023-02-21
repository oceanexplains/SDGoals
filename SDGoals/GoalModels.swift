//
//  GoalModels.swift
//  SDGoals
//
//  Created by Ocean on 2/21/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(GoalsQuery.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct GoalsQuery: Codable {
    let goals: [Goal]
    let source: Source
    let meta: Meta
}

// MARK: - Goal
struct Goal: Codable, Hashable {
    let goal: Int
    let title, short: String
    
    static func == (lhs: Goal, rhs: Goal) -> Bool {
        return lhs.goal == rhs.goal &&
        lhs.title == rhs.title &&
        lhs.short == rhs.short
    }
}
