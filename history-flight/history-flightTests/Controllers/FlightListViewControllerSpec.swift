import Nimble
import Nimble_Snapshots
import Quick

@testable import history_flight

final class FlightListViewControllerSpec: QuickSpec {
    override class func spec() {
        describe("FlightListViewController") {
            var sut: FlightListViewController!
            var viewModel: FlightListViewModel!

            beforeEach {
                let mockFlights = [
                    Flight(flightId: "AB123", status: "CONCLUIDO", completionStatus: "NO_HORARIO", startDate: "2024-08-01", endDate: "2024-08-01", departureTime: "10:00", arrivalTime: "14:00", departureAirport: "JFK", arrivalAirport: "LAX", airplaneName: "Boeing 737")
                ]
                viewModel = FlightListViewModel(flights: mockFlights)
                sut = FlightListViewController(viewModel: viewModel)
                WindowHelper.showInTestWindow(viewController: sut)
            }
            
            afterEach {
                WindowHelper.cleanTestWindow()
            }
            
            it("should display the correct layout") {
                expect(sut).toEventually(haveValidSnapshot())
            }
            
            it("should display the correct flight information") {
                expect(sut.hostingController?.rootView.viewModel.completedFlights.count).to(equal(1))
            }
        }
    }
}
