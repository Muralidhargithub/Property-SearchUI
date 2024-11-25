import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = UIColor.white

        let topImageView = UIImageView(image: UIImage(named: "Image"))
        topImageView.contentMode = .scaleAspectFit
        topImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topImageView)

        let titleLabel = createLabel(
            text: "Log in to post an ad",
            font: UIFont.systemFont(ofSize: 18, weight: .medium),
            textColor: .black,
            textAlignment: .center
        )
        view.addSubview(titleLabel)

        let facebookButton = createTransparentButton(title: "Continue with Facebook", iconName: "download")
        let googleButton = createTransparentButton(title: "Continue with Google", iconName: "google")
        let appleButton = createTransparentButton(title: "Continue with Apple", iconName: "apple")
        let emailButton = createTransparentButton(title: "Continue with Email", iconName: "email")
        //let emailButton1 = createTransparentButton(title: "Continue with Email", iconName: "email")


        let stackView = UIStackView(arrangedSubviews: [facebookButton, googleButton, appleButton, emailButton])
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        // Create Account Label
        let createAccountLabel = createLabel(
            text: "Don’t have an account? Create one",
            font: UIFont.systemFont(ofSize: 14, weight: .medium),
            textColor: .systemRed,
            textAlignment: .center
        )
        view.addSubview(createAccountLabel)

        // Footer Label
        let footerLabel = createLabel(
            text: "By logging in I agree to the Terms and Conditions and Privacy Policy",
            font: UIFont.systemFont(ofSize: 12, weight: .regular),
            textColor: .gray,
            textAlignment: .center
        )
        footerLabel.numberOfLines = 2
        view.addSubview(footerLabel)

        // Constraints
        NSLayoutConstraint.activate([
            topImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            topImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            topImageView.heightAnchor.constraint(equalToConstant: 260),

            titleLabel.topAnchor.constraint(equalTo: topImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            createAccountLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            createAccountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            createAccountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            footerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            footerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            footerLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }

    private func createTransparentButton(title: String, iconName: String) -> UIButton {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 8
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true

        let iconImageView = UIImageView(image: UIImage(named: iconName))
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true // Fixed size for icon
        iconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true

        let titleLabel = createLabel(
            text: title,
            font: UIFont.systemFont(ofSize: 16, weight: .medium),
            textColor: .black,
            textAlignment: .left
        )

        let stackView = UIStackView(arrangedSubviews: [iconImageView, titleLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false

        button.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -15),
            stackView.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        ])

        return button
    }
    private func createLabel(text: String, font: UIFont, textColor: UIColor, textAlignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

}
