//
//  FligthListViewModel.swift
//  history-flight
//
//  Created by Pablo Filmes on 09/10/24.
//

import Foundation

class FlightListViewModel: ObservableObject {
    @Published var completedFlights: [Flight] = []
    @Published var delayedFlights: [Flight] = []
    @Published var cancelledFlights: [Flight] = []

    private var allFlights: [Flight] = []
    
    init(flights: [Flight]) {
        self.allFlights = flights
        filterFlights()
    }
    
    private func filterFlights() {
        self.completedFlights = allFlights.filter { $0.status == "CONCLUIDO" }
        self.delayedFlights = allFlights.filter { $0.completionStatus == "ATRASOU" }
        self.cancelledFlights = allFlights.filter { $0.status == "CANCELADO" }
    }
}
