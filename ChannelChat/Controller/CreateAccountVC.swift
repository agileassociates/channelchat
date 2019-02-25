//
//  CreateAccountVC.swift
//  ChannelChat
//
//  Created by Johny Babylon on 2/23/19.
//  Copyright © 2019 Agile Associates. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var usernameTxt: UIStackView!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func createAcctBtnPressed(_ sender: Any) {
        guard let email = emailTxt.text , emailTxt.text != "" else { return
            
        }
        guard let password = passwordTxt.text , passwordTxt.text != "" else {return}
        
        AuthService.instance.registeredUser(email: email, password: password)
        { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion:
                    { (success) in
                        if success {
                            print("logged in user", AuthService.instance.authToken)
                        }
                    
                    
                })
            }
        }
        
    }
}
