import Quick
import Nimble

@testable import history_flight

final class FlightListViewModelSpec: QuickSpec {
    override class func spec() {
        describe("FlightListViewModel") {
            var sut: FlightListViewModel!
            var mockFlights: [Flight]!
            
            beforeEach {
                mockFlights = [
                    Flight(flightId: "AB123", status: "CONCLUIDO", completionStatus: "NO_HORARIO", startDate: "2024-08-01", endDate: "2024-08-01", departureTime: "10:00", arrivalTime: "14:00", departureAirport: "JFK", arrivalAirport: "LAX", airplaneName: "Boeing 737"),
                    Flight(flightId: "CD456", status: "CANCELADO", completionStatus: "CANCELADO", startDate: "2024-08-01", endDate: "2024-08-01", departureTime: "11:00", arrivalTime: "14:00", departureAirport: "LAX", arrivalAirport: "SFO", airplaneName: "Airbus A320"),
                    Flight(flightId: "EF789", status: "CONCLUIDO", completionStatus: "ATRASOU", startDate: "2024-08-01", endDate: "2024-08-01", departureTime: "12:00", arrivalTime: "16:00", departureAirport: "ORD", arrivalAirport: "DFW", airplaneName: "Boeing 777")
                ]
                
                sut = FlightListViewModel(flights: mockFlights)
            }
            
            it("should correctly filter completed flights") {
                expect(sut.completedFlights.count).to(equal(2))
            }
            
            it("should correctly filter delayed flights") {
                expect(sut.delayedFlights.count).to(equal(1))
            }
            
            it("should correctly filter cancelled flights") {
                expect(sut.cancelledFlights.count).to(equal(1))
            }
        }
    }
}
