import UIKit

protocol FlightTypeDelegate: AnyObject {
    func didTapFlightType()
}

final class FlightTypeView: UIView, ViewConfiguration {

    let viewModel: FlightTypesViewModel
    weak var delegate: FlightTypeDelegate?

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Acompanhe Seus Voos"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = UIColor.customApp
        return label
    }()

    private lazy var completedStack: UIStackView = createFlightStackView(title: "Concluído")
    private lazy var delayedStack: UIStackView = createFlightStackView(title: "Atrasou")
    private lazy var cancelledStack: UIStackView = createFlightStackView(title: "Cancelado")
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [completedStack, delayedStack, cancelledStack])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private(set) lazy var actionButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Clique agora e veja todos os seus voos", for: .normal)
        button.backgroundColor = UIColor.customBackground
        button.layer.cornerRadius = 18
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    init(viewModel: FlightTypesViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupViews()
        configureViews()
        bindViewModel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func setupViews() {
        backgroundColor = UIColor.customBackground
        addSubview(titleLabel)
        addSubview(buttonsStackView)
        addSubview(actionButton)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            buttonsStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            buttonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            buttonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 400),
            
            actionButton.topAnchor.constraint(equalTo: buttonsStackView.bottomAnchor, constant: 20),
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureViews() {
        self.actionButton.addTarget(self, action: #selector(self.didTapFlightType(_:)), for: .touchUpInside)
    }
    private func bindViewModel() {
        viewModel.onFlightDataUpdated = { [weak self] flightCounts in
            self?.updateStackView(self?.completedStack, title: "Concluído", count: flightCounts.completed)
            self?.updateStackView(self?.delayedStack, title: "Atrasou", count: flightCounts.delayed)
            self?.updateStackView(self?.cancelledStack, title: "Cancelado", count: flightCounts.cancelled)
        }
        viewModel.loadFlightData()
    }
    
    private func createFlightStackView(title: String) -> UIStackView {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.customApp
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.layer.borderWidth = 2
        stackView.layer.borderColor = UIColor.customApp.cgColor
        stackView.layer.cornerRadius = 25
        stackView.backgroundColor = UIColor.customBackground
        
        titleLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        return stackView
    }

    private func updateStackView(_ stackView: UIStackView?, title: String, count: Int) {
        guard let titleLabel = stackView?.arrangedSubviews.first as? UILabel else { return }
        titleLabel.text =  "\(title) (\(count))"
    }

    @objc
    private func didTapFlightType(_ sender: UIButton) {
        self.delegate?.didTapFlightType()
    }
}
