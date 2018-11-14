//
//  ViewController.swift
//  TheRegistrationPageMVP
//
//  Created by Rafael Almeida Oliveira on 14/11/18.
//  Copyright © 2018 Rafael Almeida Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    
    var presenter: RegistrationPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = RegistrationPresenter(delegate: self as RegistrationDelegate)
    }


    @IBAction func btnRegisterPressed(_ sender: Any) {
        self.presenter?.register(email: txtEmail.text!, password: txtPassword.text!, fullName: txtFullName.text!, phoneNumber: txtPhone.text!)
    }
}

extension ViewController: RegistrationDelegate {
    func showProgress() {
        
    }
    
    func hideProgress() {
        
    }
    
    func registrationDidSucceed() {
        print("succeed")
    }
    
    func registrationDidFailed(message: String) {
        print(message)
    }
}

