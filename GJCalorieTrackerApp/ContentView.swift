//
//  ContentView.swift
//  GJCalorieTrackerApp
//
//  Created by Mitchell Wong on 5/31/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "chart.pie.fill")
                }
                .tag(0)

            Text("Food Log Screen")
                .tabItem {
                    Label("Food Log", systemImage: "list.bullet")
                }
                .tag(1)

            Text("Add Food Screen")
                .tabItem {
                    Label("Add Food", systemImage: "plus.circle.fill")
                }
                .tag(2)

            Text("Analysis Screen")
                .tabItem {
                    Label("Analysis", systemImage: "chart.bar.fill")
                }
                .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
