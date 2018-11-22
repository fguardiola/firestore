//
//  utils.swift
//  FireStore
//
//  Created by 67621177 on 22/11/2018.
//  Copyright © 2018 67621177. All rights reserved.
//

import Foundation
import UIKit


func presentAlert(title:String, message: String, viewController: UIViewController){
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
    alert.addAction(alertAction)
    viewController.present(alert, animated: true)
    
}
