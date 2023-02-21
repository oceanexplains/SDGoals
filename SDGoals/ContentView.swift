//
//  ContentView.swift
//  SDGoals
//
//  Created by Ocean on 2/21/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink("Goals") {
                    GoalsView()
                }
                NavigationLink("Targets") {
                    TargetsView()
                }
                NavigationLink("Indicators") {
                    IndicatorsView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
