import UIKit

protocol HomeDelegate: AnyObject {
    func actionButton()
}

final class HomeView: UIView, ViewConfiguration {
    
    weak var delegate: HomeDelegate?

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 34)
        label.text = LocalizedString.titleHome.localized
        label.textColor = UIColor.customApp
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private lazy var descriptionlabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = LocalizedString.descripitionHome.localized
        label.textColor = UIColor.customApp
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()


    private(set) lazy var actionButton: UIButton = {
        let button = UIButton(frame: .zero)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(LocalizedString.titleButtonHome.localized, for: .normal)
        
        button.backgroundColor = UIColor.customBackground
        button.layer.cornerRadius = 18
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViews() {
        self.actionButton.addTarget(self, action: #selector(self.actionButton(_:)), for: .touchUpInside)
    }
    
    @objc
    private func actionButton(_ sender: UIButton) {
        self.delegate?.actionButton()
    }

    func setupViewHierarchy() {
        addSubview(titleLabel)
        addSubview(descriptionlabel)
        addSubview(actionButton)
    }
    
    func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionlabel.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 200),
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            
            descriptionlabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            descriptionlabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 48),
            descriptionlabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -48),
        
            actionButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            actionButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            actionButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -54),
            actionButton.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
}
