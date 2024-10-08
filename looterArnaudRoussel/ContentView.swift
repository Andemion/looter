//
//  ContentView.swift
//  looterArnaudRoussel
//
//  Created by ROUSSEL Arnaud on 08/10/2024.
//

import SwiftUI

struct ContentView: View {
    var loot = ["Epée", "Bouclier", "Armure"]

    var body: some View {
        List(loot) { item in
            Text(item)
        }
    }
}

#Preview {
    ContentView()
}
