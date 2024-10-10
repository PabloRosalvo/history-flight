import Nimble
import Nimble_Snapshots
import Quick

@testable import history_flight

final class FlightTypesViewControllerSpec: QuickSpec {
    override class func spec() {
        describe("FlightTypesViewController") {
            var sut: FlightTypesViewController!
            var viewModel: FlightTypesViewModel!
            
            beforeEach {
                guard let mockData = Bundle.main.loadJsonData(fileName: "flights") else {
                    print("error parsing json")
                    return
                }
                let mockRequestManager = MockRequestManager(mockData: mockData)
                let flightAPI = FlightAPI(mockRequestManager)
                
                viewModel = FlightTypesViewModel(api: flightAPI)
                
                sut = FlightTypesViewController(viewModel: viewModel)
                
                WindowHelper.showInTestWindow(viewController: sut)
            }
            
            afterEach {
                WindowHelper.cleanTestWindow()
            }
            
            it("should have the correct layout") {
                expect(sut).toEventually(haveValidSnapshot())
            }
        }
    }
}
