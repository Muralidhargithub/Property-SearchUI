import UIKit

class ViewController: UIViewController {
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()

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

        // Configure and add usernameTextField
        usernameTextField.placeholder = "Enter your username/email"
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.font = UIFont.systemFont(ofSize: 16)
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.delegate = self
        view.addSubview(usernameTextField)

        // Configure and add passwordTextField
        passwordTextField.placeholder = "Enter your password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.font = UIFont.systemFont(ofSize: 16)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.delegate = self
        view.addSubview(passwordTextField)

        let googleButton = createTransparentButton(title: "Continue with Google", iconName: "google")
        let appleButton = createTransparentButton(title: "Continue with Apple", iconName: "apple")

        let stackView = UIStackView(arrangedSubviews: [googleButton, appleButton])
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        let createAccountLabel = createLabel(
            text: "Don’t have an account? Create one",
            font: UIFont.systemFont(ofSize: 14, weight: .medium),
            textColor: .systemRed,
            textAlignment: .center
        )
        view.addSubview(createAccountLabel)

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

            usernameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            stackView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
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
        iconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
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

extension ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = .lightGray
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = .white
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            validateAndNavigate()
        }
        return true
    }
    
    func validateAndNavigate() {
        guard let user = usernameTextField.text, !user.isEmpty else {
            showAlert(message:"username can not be empty")
            return
        }
        guard let pass = passwordTextField.text, !pass.isEmpty else {
            showAlert(message:"password can not be empty")
            return
        }
        
        if user == "Murali" && pass == "Kakanuru8106" {
            navigatetonext()
        } else {
            showAlert(message:"Invalid Username / password")
        }
    }
    
    func navigatetonext() {
        guard let storyboard = storyboard,
              let nextVC = storyboard.instantiateViewController(withIdentifier: "tabbarC") as? tabbarC else {
            print("Failed to instantiate next view controller")
            return
        }
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            // Combine the current text with the new text
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            
            // Email validation
            if textField == usernameTextField {
                if !isValidEmail(updatedText) && !updatedText.isEmpty {
                    textField.layer.borderColor = UIColor.red.cgColor
                    textField.layer.borderWidth = 1.0
                } else {
                    textField.layer.borderColor = UIColor.clear.cgColor
                    textField.layer.borderWidth = 0
                }
            }
            
            // Password validation
            if textField == passwordTextField {
                if !isValidPassword(updatedText) && !updatedText.isEmpty {
                    textField.layer.borderColor = UIColor.red.cgColor
                    textField.layer.borderWidth = 1.0
                } else {
                    textField.layer.borderColor = UIColor.clear.cgColor
                    textField.layer.borderWidth = 0
                }
            }
            // Reuse the existing validation functions
            func isValidEmail(_ email: String) -> Bool {
                let emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
                let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
                return emailPredicate.evaluate(with: email)
            }
            
            func isValidPassword(_ password: String) -> Bool {
                let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*(),.?\":{}|<>]).{8,}$"
                let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
                return passwordPredicate.evaluate(with: password)
            }
            
            return true
        }
        
    }
    
