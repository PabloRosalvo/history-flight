import UIKit
import SwiftUI

class FlightListViewController: UIViewController, ViewConfiguration {
    
    let viewModel: FlightListViewModel
    lazy var flightListView = FlightListView(viewModel: viewModel)
    var hostingController: UIHostingController<FlightListView>?

    init(viewModel: FlightListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Lista de Voos"
        setupViews()
        setupViewHierarchy()
        setupConstraints()
    }

    func setupViews() {
        hostingController = UIHostingController(rootView: flightListView)
    }

    func setupViewHierarchy() {
        guard let hostingController = hostingController else { return }
        addChild(hostingController)
        view.addSubview(hostingController.view)
    }

    func setupConstraints() {
        guard let hostingController = hostingController else { return }
        hostingController.didMove(toParent: self)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
