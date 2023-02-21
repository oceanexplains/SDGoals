//
//  TargetsView.swift
//  SDGoals
//
//  Created by Ocean on 2/21/23.
//

import SwiftUI

struct TargetsView: View {
    @State var targets = [Target]()
    
    var body: some View {
        List {
            ForEach(targets, id: \.self) { target in
                Text(target.title)
            }
        }
        .task {
            await loadData()
        }
    }
    func loadData() async {
        guard let url = URL(string: "https://raw.githubusercontent.com/SDG-data/SDGs/master/targets.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(TargetsQuery.self, from: data) {
                targets = decodedResponse.targets
            }
        } catch {
            print("Invalid Data")
        }
    }
}




struct TargetsView_Previews: PreviewProvider {
    static var previews: some View {
        TargetsView()
    }
}
