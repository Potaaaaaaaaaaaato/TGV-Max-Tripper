import Foundation

struct Trip: Identifiable {
    let id = UUID()
    let departureStation: String
    let arrivalStation: String
    let departureTime: Date
    let arrivalTime: Date
}
