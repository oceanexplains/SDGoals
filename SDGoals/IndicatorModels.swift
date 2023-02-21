//
//  Models.swift
//  SDGoals
//
//  Created by Ocean on 2/21/23.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)
//JSON LINK: https://raw.githubusercontent.com/SDG-data/SDGs/master/indicators.json

import SwiftUI

// MARK: - Welcome
struct IndicatorQuery: Codable {
    let indicators: [Indicator]
    let source: [SourceElement]
    let meta: [Meta]
}

// MARK: - Indicator
struct Indicator: Codable, Hashable {
    static func == (lhs: Indicator, rhs: Indicator) -> Bool {
        return lhs.id == rhs.id &&
            lhs.goal == rhs.goal &&
            lhs.targets == rhs.targets &&
            lhs.indicator == rhs.indicator &&
            lhs.title == rhs.title &&
            lhs.data == rhs.data &&
            lhs.source == rhs.source &&
            lhs.leads == rhs.leads &&
            lhs.dataSources == rhs.dataSources &&
            lhs.available == rhs.available &&
            lhs.category == rhs.category
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(goal)
        hasher.combine(targets)
        hasher.combine(indicator)
        hasher.combine(title)
        hasher.combine(data)
        hasher.combine(source)
        hasher.combine(leads)
        hasher.combine(dataSources)
        hasher.combine(available)
        hasher.combine(category)
    }

    
    let id = UUID()
    let goal: Int
    let targets: Targets
    let indicator, title: String
    let data: DataClass
    let source: SourceEnum
    let leads: String
    let dataSources: String
    let available: Available
    let category: String

    enum CodingKeys: String, CodingKey {
        case goal, targets, indicator, title, data, source, leads
        case dataSources = "data-sources"
        case available, category
    }
}

enum Available: String, Codable {
    case availableTierIII = "Tier I/II"
    case empty = ""
    case tierI = "Tier I"
    case tierII = "Tier II"
    case tierIII = "Tier III"
    case tierIIII = "Tier I/III"
    case tierIIISoonTierII = "Tier III soon Tier II"
}

// MARK: - DataClass
struct DataClass: Codable, Hashable {
    
    static func == (lhs: DataClass, rhs: DataClass) -> Bool {
        return lhs.meta == rhs.meta &&
        lhs.url == rhs.url &&
        lhs.format == rhs.format
    }
    
    let url, format, meta: String
}

enum SourceEnum: String, Codable {
    case aug2015 = "Aug2015"
    case aug2015Dec2015Grey = "Aug2015, Dec2015-grey"
    case aug2015Nov2015Green = "Aug2015, Nov2015-green"
    case aug2015Nov2015GreenDec2015Grey = "Aug2015, Nov2015-green, Dec2015-grey"
    case dec2015Grey = "Dec2015-grey"
    case modifiedAug2015Dec2015Grey = "modified-Aug2015, Dec2015-grey"
    case modifiedAug2015Nov2015Green = "modified-Aug2015, Nov2015-green"
    case modifiedAug2015Nov2015GreenDec2015Grey = "modified-Aug2015, Nov2015-green, Dec2015-grey"
    case nov2015Green = "Nov2015-green"
    case nov2015GreenDec2015Grey = "Nov2015-green, Dec2015-grey"
    case nov201Dec2015Grey = "Nov201, Dec2015-grey"
}

// MARK: - Targets
struct Targets: Codable, Hashable {
    
    static func == (lhs: Targets, rhs: Targets) -> Bool {
        return lhs.primaryTarget == rhs.primaryTarget &&
            lhs.otherTargets == rhs.otherTargets
    }
    
    let primaryTarget, otherTargets: String

    enum CodingKeys: String, CodingKey {
        case primaryTarget = "primary-target"
        case otherTargets = "other-targets"
    }
}

// MARK: - Meta
struct Meta: Codable, Hashable {
    let id, description: String
    
    static func == (lhs: Meta, rhs: Meta) -> Bool {
        return lhs.id == rhs.id &&
        lhs.description == rhs.description
    }
}

// MARK: - SourceElement
struct SourceElement: Codable {
    let id: String
    let url: String
    let description: String
}
