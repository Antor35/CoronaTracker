//
//  ViewController.swift
//  CoronaTracker
//
//  Created by Hissain on 28/3/20.
//  Copyright © 2020 Corona Tracker. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfNumber: UITextField!
    @IBOutlet weak var tfNationalID: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnProblem: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Complete Registration"
        self.registerObservers()

        self.btnRegister.addTarget(self, action: #selector(signup(button:)), for: UIControl.Event.touchUpInside)
    }

    func registerObservers(){

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @objc func signup(button: UIButton){

        guard let name = tfName.text, !name.isEmpty else { return }
        guard let number = tfName.text, !number.isEmpty else { return }
        guard let nationalID = tfName.text, !nationalID.isEmpty else { return }

        print("Proceed with name: \(name), number: \(number) and ID: \(nationalID)")

        // Saving numbers to Preference/ User default

        UserStoreData.name = name
        UserStoreData.number = number
        UserStoreData.nationalID = nationalID

    }

    @objc func keyboardWillAppear(notification: Notification){
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.view.frame.origin.y -= keyboardHeight/2
        }
    }

    @objc func keyboardWillHide(notification: Notification){
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.view.frame.origin.y += keyboardHeight/2
        }
    }
}

