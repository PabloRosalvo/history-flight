import Nimble
import Nimble_Snapshots
import Quick

@testable import history_flight

class FlightTypeViewSpec: QuickSpec {
        override class func spec() {
            var sut: FlightTypeView!
            var viewModel: FlightTypesViewModel!
            
            beforeEach {
                guard let mockData = Bundle.main.loadJsonData(fileName: "flights") else {
                    print("error parsing json")
                    return
                }
                let mockRequestManager = MockRequestManager(mockData: mockData)
                let flightAPI = FlightAPI(mockRequestManager)
                
                viewModel = FlightTypesViewModel(api: flightAPI)
                sut = FlightTypeView(viewModel: viewModel)
                sut.frame = CGRect(x: 0, y: 0, width: 375, height: 667)
            }
            
            afterEach {
                WindowHelper.cleanTestWindow()
            }
            
            it("should have the correct layout") {
                expect(sut).toEventually(haveValidSnapshot())
            }
            
            it("should call delegate when actionButton is tapped") {
                let mockDelegate = MockFlightTypeDelegate()
                sut.delegate = mockDelegate
                sut.actionButton.sendActions(for: .touchUpInside)
                
                expect(mockDelegate.didTapFlightTypeCalled).to(beTrue())
            }
        }

}

class MockFlightTypeDelegate: FlightTypeDelegate {
    var didTapFlightTypeCalled = false
    
    func didTapFlightType() {
        didTapFlightTypeCalled = true
    }
}
