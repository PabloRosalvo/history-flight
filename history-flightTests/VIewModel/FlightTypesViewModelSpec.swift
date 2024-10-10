import Quick
import Nimble

@testable import history_flight

final class FlightTypesViewModelSpec: QuickSpec {
    override class func spec() {
        describe("FlightTypesViewModel") {
            var sut: FlightTypesViewModel!
            var mockAPI: FlightAPI!
            
            beforeEach {
                let mockData = Bundle.main.loadJsonData(fileName: "flights")!
                let mockRequestManager = MockRequestManager(mockData: mockData)
                mockAPI = FlightAPI(mockRequestManager)
                sut = FlightTypesViewModel(api: mockAPI)
            }
            
            it("should load flight data and update counts") {
                var flightCounts: FlightTypesViewModel.FlightCounts?
                
                sut.onFlightDataUpdated = { counts in
                    flightCounts = counts
                }
                
                sut.loadFlightData()
                
                expect(flightCounts?.completed).toEventually(equal(14))
                expect(flightCounts?.delayed).toEventually(equal(7))
                expect(flightCounts?.cancelled).toEventually(equal(6))
            }
            
            it("should call actionButtonTapped when action is triggered") {
                var actionCalled = false
                
                sut.actionButtonTapped = {
                    actionCalled = true
                }
                
                sut.actionButtonTappedAction()
                
                expect(actionCalled).to(beTrue())
            }
        }
    }
}
