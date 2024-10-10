import UIKit

class HomeViewController: UIViewController, HomeDelegate {
    let viewModel: HomeViewModel
    
    private lazy var contentView: HomeView = {
        let view = HomeView()
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.customBackground
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem()
        self.navigationController?.navigationBar.tintColor = UIColor.customApp
    }
    
    override func loadView() {
        self.view = contentView
    }
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func actionButton() {
        self.viewModel.actionButtonTappedAction()
    }
    
}
