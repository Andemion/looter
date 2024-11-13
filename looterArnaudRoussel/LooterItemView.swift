import SwiftUI

struct LootItemView: View {
    let item: LootItem

    var body: some View {
        HStack {
            // Cercle coloré pour la rareté
            Circle()
                .fill(item.rarity.color)
                .frame(width: 20, height: 20)
                .padding(.trailing, 10)

            VStack(alignment: .leading) {
                HStack {
                    Text(item.name)
                        .font(.headline)
                    Spacer()
                    Text("Quantité : \(item.quantity)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Text(item.type.displayEmoji)
                    .font(.largeTitle)
                    .padding(.top, 4)
            }
            .padding(.vertical, 8)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
    }
}
