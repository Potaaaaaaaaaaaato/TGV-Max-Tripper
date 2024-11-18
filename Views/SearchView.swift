import SwiftUI

struct SearchView: View {
    @State private var departureStation: String = ""
    @State private var arrivalStation: String = ""
    @State private var selectedDate: Date = Date()
    @State private var showDatePicker = false
    @State private var selectedTime: Date = Date()
    @State private var showTimePicker = false
    
    @State private var trips: [Trip] = []
    @State private var showResults = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Champ de recherche (identique à avant)
                VStack(alignment: .leading, spacing: 10) {
                    Text("Gare de départ")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.leading, 5)
                    TextField("Saisissez une gare", text: $departureStation)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .overlay(
                            HStack {
                                Spacer()
                                Image(systemName: "arrowshape.forward.circle")
                                    .foregroundColor(departureStation.isEmpty ? .red : .green)
                                    .padding(.trailing, 10)
                            }
                        )
                }
                
                // Gare d'arrivée (identique à avant)
                VStack(alignment: .leading, spacing: 10) {
                    Text("Gare d'arrivée")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.leading, 5)
                    TextField("Saisissez une gare", text: $arrivalStation)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .overlay(
                            HStack {
                                Spacer()
                                Image(systemName: "arrowshape.backward.circle")
                                    .foregroundColor(arrivalStation.isEmpty ? .red : .green)
                                    .padding(.trailing, 10)
                            }
                        )
                }
                
                // Pickers pour la date et l'heure (identique à avant)
                VStack(alignment: .leading, spacing: 10) {
                    Text("Date de départ")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.leading, 5)
                    Button(action: { showDatePicker.toggle() }) {
                        Text(selectedDate, style: .date)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                    .sheet(isPresented: $showDatePicker) {
                        VStack {
                            DatePicker("Sélectionnez une date", selection: $selectedDate, displayedComponents: .date)
                                .datePickerStyle(WheelDatePickerStyle())
                                .padding()
                            Button("Fermer") {
                                showDatePicker = false
                            }
                            .padding()
                        }
                    }
                }
                
                // Heure de départ (identique à avant)
                VStack(alignment: .leading, spacing: 10) {
                    Text("Heure de départ")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.leading, 5)
                    Button(action: { showTimePicker.toggle() }) {
                        Text(selectedTime, style: .time)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                    .sheet(isPresented: $showTimePicker) {
                        VStack {
                            DatePicker("Sélectionnez une heure", selection: $selectedTime, displayedComponents: .hourAndMinute)
                                .datePickerStyle(WheelDatePickerStyle())
                                .padding()
                            Button("Fermer") {
                                showTimePicker = false
                            }
                            .padding()
                        }
                    }
                }
                
                Spacer()
                
                // Bouton pour démarrer la recherche
                Button(action: {
                    // Appelle la logique de recherche
                    trips = searchTrips(departure: departureStation, arrival: arrivalStation, date: selectedDate)
                    showResults = true
                }) {
                    Text("Démarrer la recherche")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(15)
                }
                .padding(.horizontal)
                .disabled(departureStation.isEmpty || arrivalStation.isEmpty) // Désactive le bouton si les champs sont vides
                
                // Navigation vers les résultats
                NavigationLink(destination: ResultsView(trips: trips), isActive: $showResults) {
                    EmptyView()
                }
            }
            .padding()
            .navigationTitle("Recherche de trajet")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
