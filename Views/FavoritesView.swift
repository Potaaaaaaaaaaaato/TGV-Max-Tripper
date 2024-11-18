import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Vos trajets favoris")
                    .font(.title2)
                    .padding()

                Spacer()
            }
            .navigationTitle("Favoris")
        }
    }
}
