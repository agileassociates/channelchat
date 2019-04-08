//
//  ProfileVC.swift
//  ChannelChat
//
//  Created by Johny Babylon on 3/4/19.
//  Copyright © 2019 Agile Associates. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }


    @IBAction func logoutPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIFY_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func closeModalPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        userName.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        profileImage.image = UIImage(named: UserDataService.instance.avatarName)
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_:)))
        backgroundView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closeTap(_ recogizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
