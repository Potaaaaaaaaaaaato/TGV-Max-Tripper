import Foundation

func searchTrips(departure: String, arrival: String, date: Date) -> [Trip] {
    let calendar = Calendar.current
    let baseTime = calendar.date(bySettingHour: 9, minute: 0, second: 0, of: date) ?? Date()
    
    return [
        Trip(departureStation: departure, arrivalStation: arrival, departureTime: baseTime, arrivalTime: baseTime.addingTimeInterval(7200)),
        Trip(departureStation: departure, arrivalStation: arrival, departureTime: baseTime.addingTimeInterval(3600), arrivalTime: baseTime.addingTimeInterval(10800)),
        Trip(departureStation: departure, arrivalStation: arrival, departureTime: baseTime.addingTimeInterval(7200), arrivalTime: baseTime.addingTimeInterval(14400))
    ]
}
