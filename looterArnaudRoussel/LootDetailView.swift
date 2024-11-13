import SwiftUI

struct LootDetailView: View {
    let item: LootItem
    @State private var isFlipping = false
    @State private var isShadowVisible = false
    @State private var shadowOpacity: [Double] = [0, 0, 0, 0, 0, 0]
    @State private var circleScales: [Double] = [0, 0, 0, 0, 0, 0]
    @State private var isShaking = false

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ItemCardView(item: item, isFlipping: $isFlipping, shadowOpacity: $shadowOpacity, circleScales: $circleScales, isShaking: $isShaking)
                    .onAppear {
                        withAnimation(Animation.linear(duration: 2)) {
                            self.isFlipping = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            animateShadows()
                            startShaking()
                        }
                    }
                ItemDetailsView(item: item)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    private func animateShadows() {
        for i in 0..<shadowOpacity.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.2) {
                withAnimation(Animation.easeInOut(duration: 0.2)) {
                    shadowOpacity[i] = 0.1
                    circleScales[i] = 1.0
                }
            }
        }
    }

    private func startShaking() {
        withAnimation {
            isShaking = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                isShaking = false
            }
        }
    }
}
