import SwiftUI

struct AddItemView: View {
    @EnvironmentObject var inventory: Inventory
    @Environment(\.dismiss) var dismiss

    @State private var name: String = ""
    @State private var type: ItemType = .unknown
    @State private var rarity: Rarity = .common
    @State private var quantity: Int = 1
    @State private var attackStrength: Int? = nil
    @State private var selectedGame: Game = .emptyGame
    @State private var isAttackItem: Bool = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Ajouter un loot")) {
                    TextField("Nom de l'objet", text: $name)
                    Picker("Rareté", selection: $rarity) {
                        ForEach(Rarity.allCases) { rarity in
                            Text(rarity.displayName).tag(rarity)
                        }
                    }
                    Picker("Jeu", selection: $selectedGame) {
                        Text("Non spécifié").tag(Game.emptyGame)
                        ForEach(availableGames) { game in
                            Text(game.name).tag(game as Game?)
                        }
                    }
                    Stepper("Combien : \(quantity)", value: $quantity, in: 1...100)
                    Picker("Type", selection: $type) {
                        ForEach(ItemType.allCases) { type in
                            Text(type.displayEmoji).tag(type)
                        }
                    }
                    Toggle("Item d'attaque ?", isOn: $isAttackItem)
                        .onChange(of: isAttackItem) { value in
                            if !value {
                                attackStrength = nil
                            }
                        }
                    if isAttackItem {
                        Stepper("Force d'attaque: \(attackStrength ?? 0)", value: Binding(
                            get: { attackStrength ?? 0 },
                            set: { newValue in attackStrength = newValue }
                        ), in: 0...100)
                    }
                }
                Button("Ajouter l'objet") {
                    let newItem = LootItem(name: name, type: type, rarity: rarity, attackStrength: isAttackItem ? attackStrength : nil, game: selectedGame, quantity: quantity)
                    inventory.addItem(item: newItem)
                    dismiss()
                }
            }
            .navigationBarTitle("Ajouter un loot")
        }
    }
}
