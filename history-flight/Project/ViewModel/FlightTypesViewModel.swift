import Foundation

class FlightTypesViewModel {
    typealias FlightCounts = (completed: Int, delayed: Int, cancelled: Int)
    
    private let api: FlightAPI
    private var flightsResponse: FlightsResponse? {
        didSet {
            updateFlightCountsAndNotify()
        }
    }
    
    var flights: [Flight] {
        return flightsResponse?.flights ?? []
    }
    
    var onFlightDataUpdated: ((FlightCounts) -> Void)?
    
    var actionButtonTapped: (() -> Void)?

    init(api: FlightAPI) {
        self.api = api
    }
    
    func loadFlightData() {
        api.fetchList { [weak self] flights, error in
            if let flights = flights {
                self?.flightsResponse = flights
            } else if let error = error {
                print("\(error)")
            }
        }
    }   
    
    private func updateFlightCountsAndNotify() {
        guard let flights = flightsResponse?.flights, !flights.isEmpty else { return }
        
        let completedCount = flights.filter { $0.status == "CONCLUIDO" }.count
        let delayedCount = flights.filter { $0.completionStatus == "ATRASOU" }.count
        let cancelledCount = flights.filter { $0.status == "CANCELADO" }.count
        
        let flightCounts: FlightCounts = (completed: completedCount, delayed: delayedCount, cancelled: cancelledCount)
        
        onFlightDataUpdated?(flightCounts)
    }
    
    func actionButtonTappedAction() {
        actionButtonTapped?()
    }
}
