//
//  RegisterVC.swift
//  FireStore
//
//  Created by 67621177 on 22/11/2018.
//  Copyright © 2018 67621177. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterVC: UIViewController {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = FS_RED

    }

    @IBAction func registerBtnPressed(_ sender: Any) {
        guard let email = emailTxt.text, email.isNotEmpty,let password = passwordTxt.text, password.isNotEmpty else { return }
        spinner.startAnimating()
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                self.spinner.stopAnimating()
                debugPrint(error.localizedDescription)
                presentAlert(title: "Encountered an error on registration. Try again", message: "", viewController: self)
                return
            }
            
            print("New user created!!")
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if let error = error {
                    self.spinner.stopAnimating()
                    debugPrint(error.localizedDescription)
                    presentAlert(title: "Encountered an error on registration step 2. Try again", message: "", viewController: self)
                }
                print("User logged In!!")
                self.dismiss(animated: true, completion: nil)
            }
           
        }
    }
    
}
