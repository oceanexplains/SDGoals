//
//  GoalModels.swift
//  SDGoals
//
//  Created by Ocean on 2/21/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct TargetsQuery: Codable, Hashable {
    static func == (lhs: TargetsQuery, rhs: TargetsQuery) -> Bool {
        return lhs.targets == rhs.targets &&
        lhs.source == rhs.source &&
        lhs.meta == rhs.meta
    }
    
    
    let targets: [Target]
    let source: Source
    let meta: Meta
    
    
}

// MARK: - Meta - declared in Indicator Models
//struct Meta: Codable {
//    let id, description: String
//}

// MARK: - Source
struct Source: Codable, Hashable {
    let url: String
    let date: String
    
    static func == (lhs: Source, rhs: Source) -> Bool {
        return lhs.url == rhs.url &&
        lhs.date == rhs.date
    }
}

// MARK: - Target
struct Target: Codable, Hashable {
    let goal: Int
    let id, title: String
    
    static func == (lhs: Target, rhs: Target) -> Bool {
        return lhs.goal == rhs.goal &&
        lhs.title == rhs.title &&
        lhs.id == rhs.id
    }
}
