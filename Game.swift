//
//  Game.swift
//  looterArnaudRoussel
//
//  Created by ROUSSEL Arnaud on 13/11/2024.
//

import Foundation

enum GameGenre {
    case mmorpg, rpg, looter, fps, tps, strategy, unset
}

struct Game: Identifiable, Hashable {
    let name: String
    let id: UUID = UUID()
    let genre: GameGenre
    let coverName : String?
    
    static var emptyGame = Game(name: "", genre: .unset, coverName: nil)
}

// Hesitez pas mettre vos propres jeux dans la liste
let availableGames = [
    Game(name: "Elden Ring", genre: .rpg, coverName: "elden" ),
    Game(name: "Skyrim", genre: .rpg, coverName: "Skyrim"),
    Game(name: "WoW", genre: .mmorpg, coverName: "World_of_Warcraft"),
    Game(name: "CS:GO", genre: .fps, coverName: "CSGO"),
    Game(name: "Diablo IV", genre: .looter, coverName: "Diablo IV")
]
