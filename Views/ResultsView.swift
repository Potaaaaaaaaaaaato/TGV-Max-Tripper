import SwiftUI

struct ResultsView: View {
    let trips: [Trip]
    
    var body: some View {
        List(trips) { trip in
            VStack(alignment: .leading, spacing: 5) {
                Text("\(trip.departureStation) → \(trip.arrivalStation)")
                    .font(.headline)
                Text("Départ : \(formattedDate(trip.departureTime))")
                Text("Arrivée : \(formattedDate(trip.arrivalTime))")
            }
            .padding()
        }
        .navigationTitle("Résultats")
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
