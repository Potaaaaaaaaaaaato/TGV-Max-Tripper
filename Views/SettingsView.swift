import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Paramètres de l'application")
                    .font(.title2)
                    .padding()

                Spacer()
            }
            .navigationTitle("Paramètres")
        }
    }
}
