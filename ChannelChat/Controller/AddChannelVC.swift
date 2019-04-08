//
//  AddChannelVC.swift
//  ChannelChat
//
//  Created by Johny Babylon on 3/16/19.
//  Copyright © 2019 Agile Associates. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var descriptionTxt: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    func setupView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
        nameTxt.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.3266413212, green: 0.4215201139, blue: 0.7752227187, alpha: 1)])
        descriptionTxt.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.3266413212, green: 0.4215201139, blue: 0.7752227187, alpha: 1)])
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createBtnPressed(_ sender: Any) {
        guard let channelName = nameTxt.text, nameTxt.text != "" else {return}
        guard let channelDesc = descriptionTxt.text, descriptionTxt.text != "" else {return}
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channelDesc) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    

}
