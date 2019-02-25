//
//  CreateAccountVC.swift
//  ChannelChat
//
//  Created by Johny Babylon on 2/23/19.
//  Copyright © 2019 Agile Associates. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func createAcctBtnPressed(_ sender: Any) {
        
        guard let name = usernameTxt.text , usernameTxt.text != "" else { return }
        guard let email = emailTxt.text , emailTxt.text != "" else { return }
        guard let password = passwordTxt.text , passwordTxt.text != "" else {return}
        
        AuthService.instance.registeredUser(email: email, password: password)
        { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion:
                    { (success) in
                        if success {
                            AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion:
                                { (success) in
                                    if success {
                                        print("name: " + UserDataService.instance.name,
                                              "avatar_name: " + UserDataService.instance.avatarName)
                                        self.performSegue(withIdentifier: UNWIND, sender: nil)
                                    }
                                    
                            })
                        }
                    
                })
            }
        }
        
    }
}
