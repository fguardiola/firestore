//
//  HomeVC.swift
//  FireStore
//
//  Created by 67621177 on 22/11/2018.
//  Copyright © 2018 67621177. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func loginBtnClicked(_ sender: Any) {
        // navigate to login storyboard
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LoginStory")
        self.present(controller, animated: true, completion: nil)
    }
    
}
