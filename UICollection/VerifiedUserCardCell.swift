import UIKit

class VerifiedUserCardCell: UICollectionViewCell {
    static let identifier = "VerifiedUserCardCell"
    
    // Subviews
    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.1)
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let badgeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = UIColor.systemBlue
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor.black
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.darkGray
        label.numberOfLines = 0 // Allow multi-line text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let buttonLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor.systemBlue
        label.isUserInteractionEnabled = true // Enable interaction for taps
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCard()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Setup Card UI
    private func setupCard() {
        // Add card view to content view
        contentView.addSubview(cardView)
        
        // Add subviews to card view
        cardView.addSubview(badgeImageView)
        cardView.addSubview(titleLabel)
        cardView.addSubview(subtitleLabel)
        cardView.addSubview(buttonLabel)
        
        // Layout constraints
        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            badgeImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 15),
            badgeImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 15),
            badgeImageView.widthAnchor.constraint(equalToConstant: 40),
            badgeImageView.heightAnchor.constraint(equalToConstant: 40),
            
            titleLabel.leadingAnchor.constraint(equalTo: badgeImageView.trailingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -15),
            titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 15),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: badgeImageView.trailingAnchor, constant: 15),
            subtitleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -15),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            
            buttonLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -15),
            buttonLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -15),
            buttonLabel.topAnchor.constraint(greaterThanOrEqualTo: subtitleLabel.bottomAnchor, constant: 10)
        ])
    }
    
    func configure(title: String, subtitle: String, buttonText: String, badgeImage: UIImage) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        buttonLabel.text = buttonText
        badgeImageView.image = badgeImage
    }
}
