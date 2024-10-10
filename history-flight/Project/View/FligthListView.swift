import SwiftUI

struct FlightListView: View {
    let viewModel: FlightListViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 40) {
                    
                    VStack(alignment: .leading) {
                        Text("Concluídos")
                            .font(.headline)
                            .padding(.leading)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(viewModel.completedFlights) { flight in
                                    FlightCardView(flight: flight)
                                }
                            }
                            .padding(.leading)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Atrasados")
                            .font(.headline)
                            .padding(.leading)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(viewModel.delayedFlights) { flight in
                                    FlightCardView(flight: flight)
                                }
                            }
                            .padding(.leading)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Cancelados")
                            .font(.headline)
                            .padding(.leading)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(viewModel.cancelledFlights) { flight in
                                    FlightCardView(flight: flight)
                                }
                            }
                            .padding(.leading)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Voos")
        }
    }
}


struct FlightCardView: View {
    let flight: Flight

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Voo: \(flight.flightId)")
                .font(.title2)
            Text("\(flight.departureAirport) → \(flight.arrivalAirport)")
                .font(.subheadline)
            Text("Partida: \(flight.departureTime) - Chegada: \(flight.arrivalTime)")
                .font(.footnote)
            Text("Data: \(flight.startDate) até \(flight.endDate)")
                .font(.footnote)
            Text("Avião: \(flight.airplaneName)")
                .font(.footnote)
            Text("Status: \(flight.completionStatus)")
                .font(.footnote)
                .foregroundColor(flight.completionStatus == "ATRASOU" ? .orange : .green)
        }
        .frame(width: 300, height: 200)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}
