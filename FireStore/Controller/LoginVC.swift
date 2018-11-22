//
//  ViewController.swift
//  FireStore
//
//  Created by 67621177 on 22/11/2018.
//  Copyright © 2018 67621177. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    //Outlets
    
    @IBOutlet weak var emilTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    //Variables
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = FS_RED
        
    }

    @IBAction func loginBtnPressed(_ sender: Any) {
        guard let email = emilTxt.text, email.isNotEmpty, let password = passwordTxt.text, password.isNotEmpty else { return }
        spinner.startAnimating()
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                self.spinner.stopAnimating()
                debugPrint(error.localizedDescription)
                presentAlert(title: "Encountered an error logging you in. Try again", message: "", viewController: self)
                
                return
            }
                print("User logged In!!")
                self.spinner.stopAnimating()
                self.dismiss(animated: true, completion: nil)
           
        }
        
    }
    @IBAction func facebookLoginPressed(_ sender: Any) {
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToCreateAccount", sender: self)
        
        
    }
    
    @IBAction func forgotPasswordPressed(_ sender: Any) {
        guard let email = emilTxt.text, email.isNotEmpty else { return }
        spinner.startAnimating()
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                self.spinner.stopAnimating()
                debugPrint(error.localizedDescription)
                return
            }
            self.spinner.stopAnimating()
            presentAlert(title: "Check your email for password reset!!", message: "", viewController: self)
        }
    }
    
}

