//
//  RegistrationPresenter.swift
//  TheRegistrationPageMVP
//
//  Created by Rafael Almeida Oliveira on 14/11/18.
//  Copyright © 2018 Rafael Almeida Oliveira. All rights reserved.
//

import Foundation

protocol RegistrationDelegate {
    func showProgress()
    func hideProgress()
    func registrationDidSucceed()
    func registrationDidFailed(message: String)
}

class RegistrationPresenter {
    var delegate: RegistrationDelegate
    
    init(delegate: RegistrationDelegate) {
        self.delegate = delegate
    }
    
    func register(email: String, password: String, fullName: String, phoneNumber: String) {
        if email.isEmpty {
            self.delegate.registrationDidFailed(message: "email can't be blank")
        }
        if password.isEmpty {
            self.delegate.registrationDidFailed(message: "password can't be blank")
        }
        if fullName.isEmpty {
            self.delegate.registrationDidFailed(message: "full name can't be blank")
        }
        if phoneNumber.isEmpty {
            self.delegate.registrationDidFailed(message: "phone number can't be blank")
        }
        if password.count < 8 {
            self.delegate.registrationDidFailed(message: "the minimum password lenght is 8 char")
        }
        self.delegate.showProgress()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.delegate.hideProgress()
            self.delegate.registrationDidSucceed()
        }
    }
}
