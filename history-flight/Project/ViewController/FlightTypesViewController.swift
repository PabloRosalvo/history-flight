import UIKit

class FlightTypesViewController: UIViewController, FlightTypeDelegate {
   
    private var viewModel: FlightTypesViewModel
    
    private lazy var contentView: FlightTypeView = {
        let view = FlightTypeView(viewModel: viewModel)
        view.delegate = self
        return view
    }()

    init(viewModel: FlightTypesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadFlightData()
    }
    
    func didTapFlightType() {
        viewModel.actionButtonTappedAction()
    }
}
