import Foundation
import SwiftUI

struct LootItem: Identifiable {
    let id: UUID = UUID()
    let name: String
    let type: ItemType
    let rarity: Rarity
    let attackStrength: Int?
    let game: Game
    let quantity: Int
}

let availableItems = [
    LootItem(name: "Épée du Désespoir", type: .dagger, rarity: .common, attackStrength: 10, game: availableGames[0], quantity: 2),
    LootItem(name: "Flamme", type: .fire, rarity: .rare, attackStrength: 40, game: availableGames[1], quantity: 1),
    LootItem(name: "Arc Antique", type: .bow, rarity: .epic, attackStrength: 150, game: availableGames[2], quantity: 1),
    LootItem(name: "Soin", type: .magic, rarity: .unique, attackStrength: nil, game: availableGames[3], quantity: 4)
]

enum Rarity: CaseIterable, Identifiable {
    case common
    case uncommon
    case rare
    case epic
    case legendary
    case unique

    var id: Rarity { self }

    var color: Color {
        switch self {
        case .common: return .gray
        case .uncommon: return .green
        case .rare: return .blue
        case .epic: return .purple
        case .legendary: return .orange
        case .unique: return .red
        }
    }

    var displayName: String {
        switch self {
        case .common: return "Common"
        case .uncommon: return "Uncommon"
        case .rare: return "Rare"
        case .epic: return "Epic"
        case .legendary: return "Legendary"
        case .unique: return "Unique"
        }
    }
}

enum ItemType: CaseIterable, Identifiable {
    case magic
    case fire
    case ice
    case wind
    case poison
    case thunder
    case dagger
    case shield
    case bow
    case ring
    case unknown

    var id: ItemType { self }

    var displayEmoji: String {
        switch self {
        case .magic: return "⭐️"
        case .fire: return "🔥"
        case .ice: return "❄️"
        case .wind: return "💨"
        case .poison: return "☠️"
        case .thunder: return "⚡️"
        case .dagger: return "🗡️"
        case .shield: return "🛡️"
        case .bow: return "🏹"
        case .ring: return "💍"
        case .unknown: return "🎲"
        }
    }
}
