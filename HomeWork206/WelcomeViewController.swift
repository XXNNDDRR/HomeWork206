//
//  WelcomeViewController.swift
//  HomeWork206
//
//  Created by Alexander on 28.11.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    var welcomeLabelText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, \(welcomeLabelText ?? "")"

    }
    
    @IBAction func cancelButtonAction() {
        dismiss(animated: true)
    }
    
}
