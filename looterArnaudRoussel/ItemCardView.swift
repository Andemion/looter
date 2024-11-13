import SwiftUI

struct ItemCardView: View {
    let item: LootItem
    @Binding var isFlipping: Bool
    @Binding var shadowOpacity: [Double]
    @Binding var circleScales: [Double]
    @Binding var isShaking: Bool

    var body: some View {
        VStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(item.rarity.color)
                    .frame(width: 120, height: 120)
                    .rotation3DEffect(
                        Angle(degrees: isFlipping ? 360 : 0),
                        axis: (x: 1, y: -1, z: 0)
                    )
                ForEach(0..<6) { index in
                    Circle()
                        .fill(item.rarity.color.opacity(shadowOpacity[index]))
                        .frame(width: 150 + CGFloat(index) * 20, height: 150 + CGFloat(index) * 20)
                        .scaleEffect(circleScales[index])
                        .animation(Animation.easeInOut(duration: 0.2).delay(Double(index) * 0.2), value: circleScales[index])
                }
                Text(item.type.displayEmoji)
                    .font(.system(size: 80))
                    .foregroundColor(.white)
                    .rotation3DEffect(
                        Angle(degrees: isFlipping ? 360 : 0),
                        axis: (x: 1, y: -1, z: 0)
                    )
            }
            .padding(.top, 20)
            .padding(.bottom, 20)

            VStack(spacing: 4) {
                Text(item.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(item.rarity.color)
                if item.rarity == .unique {
                    HStack(spacing: 4) {
                        Image(systemName: "trophy.fill")
                            .foregroundColor(.yellow)
                        Text("Item Unique")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.vertical, 2)
                            .padding(.horizontal, 8)
                            .background(Color.yellow)
                            .cornerRadius(5)
                    }
                    .offset(x: isShaking ? 5 : -5)
                    .animation(Animation.easeInOut(duration: 0.1).repeatForever(autoreverses: true), value: isShaking)
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
