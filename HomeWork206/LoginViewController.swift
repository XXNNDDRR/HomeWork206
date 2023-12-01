import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    private let user = User.getUserData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let welcomeVC = tabBarController.viewControllers?.first as! WelcomeViewController
        let navigationVC = tabBarController.viewControllers?.last as! UINavigationController
        var aboutUserVC = navigationVC.topViewController as! AboutMeViewController
        welcomeVC.user = user
        aboutUserVC.user = user
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameField.text == user.login, passwordField.text == user.password else {
            showAlert(title: "Неверные имя пользователя или пароль", message: "Введите правильные логин и пароль")
            return false
        }
        return true
    }

    @IBAction func logInButtonAction() {
        guard
            userNameField.text == user.login,
            passwordField.text == user.password
        else {
            showAlert(title: "Неверные имя пользователя или пароль", message: "Введите корректные имя и пароль")
            return
        }
                performSegue(withIdentifier: "logIn", sender: nil)
    }
    @IBAction func forgotUserNameButton() {
        showAlert(title: "Ой", message: "Ваше имя пользователя \(user.login)")
    }
    
    @IBAction func forgotPasswordButton() {
        showAlert(title: "Ой", message: "Ваш пароль \(user.password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameField.text = ""
        passwordField.text = ""
    }
}

extension LoginViewController {
    private func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let showAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordField.text = ""
        }
        showAlert.addAction(okAction)
        present(showAlert, animated: true)
    }
}
