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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
        }
    }
    
    func setup() {
        spinner.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
        
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    
    @IBAction func createAcctBtnPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        
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
                                        self.spinner.isHidden = true
                                        self.spinner.stopAnimating()
                                        print("name: " + UserDataService.instance.name,
                                              "avatar_name: " + UserDataService.instance.avatarName)
                                        self.performSegue(withIdentifier: UNWIND, sender: nil)
                                        NotificationCenter.default.post(name: NOTIFY_USER_DATA_DID_CHANGE, object: nil)
                                    }
                            })
                        }
                })
            }
        }
    }
    
    
}
