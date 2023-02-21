//
//  GoalsView.swift
//  SDGoals
//
//  Created by Tomer Zilbershtein on 2/21/23.
//

import SwiftUI

struct GoalsView: View {
    @State var goals = [Goal]()
    
    var body: some View {
        List {
            ForEach(goals, id: \.self) { goal in
                Text(goal.title)
            }
        }
        .task {
            await loadData()
        }
    }
    func loadData() async {
        guard let url = URL(string: "https://raw.githubusercontent.com/SDG-data/SDGs/master/goals.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(GoalsQuery.self, from: data) {
                goals = decodedResponse.goals
            }
        } catch {
            print("Invalid Data")
        }
    }
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView()
    }
}
