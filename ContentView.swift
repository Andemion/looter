import SwiftUI

class Inventory: ObservableObject {
    @Published var loot = [LootItem]()

    func addItem(item: LootItem) {
        loot.append(item)
    }
}

struct ContentView: View {

    @StateObject var inventory = Inventory()
    @State private var showAddItemView = false
    @State private var selectedItem: LootItem? = nil

    var body: some View {
        NavigationStack {
            List {
                ForEach(inventory.loot) { item in
                    Button(action: {
                        selectedItem = item
                    }) {
                        LootItemView(item: item)
                    }
                }
            }
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView().environmentObject(inventory)
            })
            .navigationBarTitle("🧳 Inventaire")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        showAddItemView.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
            }
            .background(
                NavigationLink(
                    destination: LootDetailView(item: selectedItem ?? availableItems[0]),
                    isActive: Binding(
                        get: { selectedItem != nil },
                        set: { if !$0 { selectedItem = nil } }
                    )
                ) {
                    EmptyView()
                }
                .hidden()
            )
        }
        .onAppear {
            // Ajouter des éléments de test à l'inventaire
            inventory.loot = availableItems
        }
    }
}

#Preview {
    ContentView()
}
