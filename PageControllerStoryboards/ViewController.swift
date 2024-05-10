//
//  ViewController.swift
//  PageControllerStoryboards
//
//  Created by Sandra Gomez on 5/6/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myTextField: UITextField!
    
    static let notificationName = Notification.Name("myNotification")
    
    @objc func onNotification(notification: Notification) {
        let data = notification.object
        let temp = String(describing: data!)
        myTextField.text = temp
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(onNotification(notification:)), name: ViewController.notificationName, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let dataSent = myTextField.text
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "myNotification"), object: dataSent)
    }
}

