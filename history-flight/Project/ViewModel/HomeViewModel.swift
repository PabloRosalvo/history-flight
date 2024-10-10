import Foundation

class HomeViewModel {
    var actionButtonTapped: (() -> Void)?
 
    func actionButtonTappedAction() {
        actionButtonTapped?()
    }
}
