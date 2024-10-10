import Quick
import Nimble

@testable import history_flight

final class HomeViewModelSpec: QuickSpec {
    override class func spec() {
        describe("HomeViewModel") {
            var sut: HomeViewModel!
            
            beforeEach {
                sut = HomeViewModel()
            }

            it("should call actionButtonTapped when actionButtonTappedAction is called") {
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
