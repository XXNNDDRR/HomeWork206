//
//  ViewController.swift
//  HomeWork206
//
//  Created by Alexander on 28.11.2023.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    private let userName = "King"
    private let userPassword = "12345"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as? WelcomeViewController
        welcomeVC?.welcomeLabelText = userNameField.text
    }

    @IBAction func logInButtonAction() {
        guard
            userNameField.text == userName,
            passwordField.text == userPassword
        else {
            showAlert(title: "Неверные имя пользователя или пароль", message: "Введите корректные имя и пароль")
            return
        }
                
    }
    @IBAction func forgotUserNameButton() {
        showAlert(title: "Ой", message: "Ваше имя пользователя \(userName)")
    }
    
    @IBAction func forgotPasswordButton() {
        showAlert(title: "Ой", message: "Ваш пароль \(userPassword)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameField.text = nil
        passwordField.text = nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
}

extension LoginViewController {
    private func showAlert(title: String, message: String) {
        let showAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        showAlert.addAction(okAction)
        present(showAlert, animated: true)
    }
}
