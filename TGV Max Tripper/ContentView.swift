import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Rechercher")
                }

            FavoritesView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favoris")
                }

            EconomyView()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Économies")
                }

            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Paramètres")
                }
        }
        .accentColor(Color.blue) // Personnalisation de la couleur des onglets
    }
}
