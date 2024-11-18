import SwiftUI

struct EconomyView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Vos économies réalisées")
                    .font(.title2)
                    .padding()

                Spacer()
            }
            .navigationTitle("Économies")
        }
    }
}
