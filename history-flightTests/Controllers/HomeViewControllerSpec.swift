import Nimble
import Nimble_Snapshots
import Quick

@testable import history_flight

final class HomeViewControllerSpec: QuickSpec {
    override class func spec() {
        describe("HomeViewController") {
            var sut: HomeViewController!
            var viewModel: HomeViewModel!
                
            beforeEach {
                viewModel = HomeViewModel()
                sut = HomeViewController(viewModel: viewModel)
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
