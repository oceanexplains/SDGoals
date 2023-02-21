//
//  IndicatorsView.swift
//  SDGoals
//
//  Created by Ocean on 2/21/23.
//

import SwiftUI

struct IndicatorsView: View {
    
    @State var indicators = [Indicator]()
    
    var body: some View {
        List {
            ForEach(indicators, id: \.self) { indicator in
                Text(indicator.title)
            }
        }
        .task {
            await loadData()
        }
    }
    func loadData() async {
        guard let url = URL(string: "https://raw.githubusercontent.com/SDG-data/SDGs/master/indicators.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(IndicatorQuery.self, from: data) {
                indicators = decodedResponse.indicators
            }
        } catch {
            print("Invalid Data")
        }
    }
}

struct IndicatorsView_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorsView()
    }
}
