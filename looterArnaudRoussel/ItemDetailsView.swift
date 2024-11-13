import SwiftUI

struct ItemDetailsView: View {
    let item: LootItem

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack(alignment: .leading, spacing: 8) {
                if let coverName = item.game.coverName {
                    Image(coverName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100)
                        .cornerRadius(10)
                }
                Text(item.game.name)
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.top, 20)
            .padding(.bottom, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            VStack(alignment: .leading, spacing: 8) {
                Text("In-game : \(item.name)")
                    .font(.subheadline)
                if let attackStrength = item.attackStrength {
                    Text("Puissance (ATQ) : \(attackStrength)")
                        .font(.subheadline)
                }
                Text("Possédé(s) : \(item.quantity)")
                    .font(.subheadline)
                Text("Rareté : \(item.rarity.displayName)")
                    .font(.subheadline)
                    .foregroundColor(item.rarity.color)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
