import Nimble
import Nimble_Snapshots
import Quick

@testable import history_flight

class HomeViewSpec: QuickSpec {
    override class func spec() {
        describe("HomeView") {
            var sut: HomeView!
            
            beforeEach {
                sut = HomeView(frame: CGRect(x: 0, y: 0, width: 375, height: 667)) 
                sut.configureViews()
                sut.setupViewHierarchy()
                sut.setupConstraints()
            }
            
            it("should have the correct layout") {
                expect(sut).toEventually(haveValidSnapshot())
            }
            
            it("should call delegate when actionButton is tapped") {
                let mockDelegate = MockHomeDelegate()
                sut.delegate = mockDelegate
                sut.actionButton.sendActions(for: .touchUpInside)
                
                expect(mockDelegate.actionButtonCalled).to(beTrue())
            }
        }
    }
}

class MockHomeDelegate: HomeDelegate {
    var actionButtonCalled = false
    
    func actionButton() {
        actionButtonCalled = true
    }
}
