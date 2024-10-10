import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    weak var parentCoordinator: Coordinator?
    
    // Declarando o viewModel como variável de instância
    var flightTypesViewModel: FlightTypesViewModel?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = HomeViewModel()
        let viewController = HomeViewController(viewModel: viewModel)
        viewModel.actionButtonTapped = { [weak self] in
            self?.goToHome()
        }
        viewController.coordinator = self
        navigationController.setViewControllers([viewController], animated: false)
        parentCoordinator?.childCoordinators.append(self)
    }
    
    func goToHome() {
        guard let mockData = Bundle.main.loadJsonData(fileName: "flights") else {
            print("error parsing json")
            return
        }
        let mockRequestManager = MockRequestManager(mockData: mockData)
        let flightAPI = FlightAPI(mockRequestManager)
        
        flightTypesViewModel = FlightTypesViewModel(api: flightAPI)
        flightTypesViewModel?.actionButtonTapped = { [weak self] in
            self?.goToListFlight()
        }
        let flightTypesViewController = FlightTypesViewController(viewModel: flightTypesViewModel!)
        navigationController.pushViewController(flightTypesViewController, animated: true)
    }
    
    func goToListFlight() {
        guard let flightTypesViewModel = flightTypesViewModel else {
            return
        }
        let viewModel = FlightListViewModel(flights: flightTypesViewModel.flights)
        let flightListViewController = FlightListViewController(viewModel: viewModel)
        navigationController.pushViewController(flightListViewController, animated: true)
    }
    
    func back() {
        navigationController.popViewController(animated: true)
    }
}
