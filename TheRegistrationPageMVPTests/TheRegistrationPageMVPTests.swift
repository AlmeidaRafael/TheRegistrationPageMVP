//
//  TheRegistrationPageMVPTests.swift
//  TheRegistrationPageMVPTests
//
//  Created by Rafael Almeida Oliveira on 14/11/18.
//  Copyright © 2018 Rafael Almeida Oliveira. All rights reserved.
//

import XCTest
@testable import TheRegistrationPageMVP

class TheRegistrationPageMVPTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testRegisterWithEmptyEmail() {
        let expec = expectation(description: "registration with empty email")
        let registrationPresenter = RegistrationPresenter(delegate: MockUIViewController1(expectation: expec))
        registrationPresenter.register(email: "", password: "123456789", fullName: "Rafael Almeida", phoneNumber: "129129191")
        wait(for: [expec], timeout: 3)
    }
    
    func testRegistrationWithEmptyPassword() {
        let expec = expectation(description: "registration with empty password")
        let registrationPresenter = RegistrationPresenter(delegate: MockUIViewController2(expectation: expec))
        registrationPresenter.register(email: "rafael@gmail.com", password: "", fullName: "Rafael Almeida", phoneNumber: "12312312")
        wait(for: [expec], timeout: 3)
    }
    
    func testRegistrarionWithPasswordLessThan8Char() {
        let expec = expectation(description: "registration with min password char is 8")
        let registrationPresenter = RegistrationPresenter(delegate: MockUIViewController3(expectation: expec))
        registrationPresenter.register(email: "rafael@gmail.com", password: "123", fullName: "Rafael Almeida", phoneNumber: "12312312")
        wait(for: [expec], timeout: 3)
    }
    
    func testRegistrationWithEmptyFullName() {
        let expec = expectation(description: "registration with empty fullname")
        let registrationPresenter = RegistrationPresenter(delegate: MockUIViewController4(expectation: expec))
        registrationPresenter.register(email: "rafael@gmail.com", password: "12345678", fullName: "", phoneNumber: "12312312")
        wait(for: [expec], timeout: 3)
    }
    
    func testRegistrationWithEmptyPhoneNumber() {
        let expec = expectation(description: "registration with empty phone number")
        let registrationPresenter = RegistrationPresenter(delegate: MockUIViewController5(expectation: expec))
        registrationPresenter.register(email: "rafael@gmail.com", password: "12345678", fullName: "Rafael Almeida", phoneNumber: "")
        wait(for: [expec], timeout: 3)
    }
    
    func testRegisterWithAllFilled() {
        let expec = expectation(description: "registration suceeded")
        let registrationPresenter = RegistrationPresenter(delegate: MockUIViewController6(expectation: expec))
        registrationPresenter.register(email: "rafael@gmail.com", password: "12345678", fullName: "Rafael Almeida", phoneNumber: "123210301")
        wait(for: [expec], timeout: 3)
    }

}

class MockUIViewController1: RegistrationDelegate {
    var expec: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expec = expectation
    }
    func showProgress() {}
    func hideProgress() {}
    func registrationDidSucceed(){}
    func registrationDidFailed(message: String) {
        XCTAssertEqual(message, "email can't be blank")
        self.expec.fulfill()
    }
}

class MockUIViewController2: RegistrationDelegate {
    var expec: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expec = expectation
    }
    
    func showProgress() {}
    func hideProgress() {}
    func registrationDidSucceed() {}
    func registrationDidFailed(message: String) {
        XCTAssertEqual(message, "password can't be blank")
        self.expec.fulfill()
    }
}

class MockUIViewController3: RegistrationDelegate {
    var expec: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expec = expectation
    }
    
    func showProgress() {}
    func hideProgress() {}
    func registrationDidSucceed() {}
    func registrationDidFailed(message: String) {
        XCTAssertEqual(message, "the minimum password lenght is 8 char")
        self.expec.fulfill()
    }
}

class MockUIViewController4: RegistrationDelegate {
    var expec: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expec = expectation
    }
    
    func showProgress() {}
    func hideProgress() {}
    func registrationDidSucceed() {}
    func registrationDidFailed(message: String) {
        XCTAssertEqual(message, "full name can't be blank")
        self.expec.fulfill()
    }
}

class MockUIViewController5: RegistrationDelegate {
    var expec: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expec = expectation
    }
    
    func showProgress() {}
    func hideProgress() {}
    func registrationDidSucceed() {}
    func registrationDidFailed(message: String) {
        XCTAssertEqual(message, "phone number can't be blank")
        self.expec.fulfill()
    }
}

class MockUIViewController6: RegistrationDelegate {
    var expec: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expec = expectation
    }
    
    func showProgress() {}
    func hideProgress() {}
    func registrationDidSucceed() {
        XCTAssertTrue(true)
        self.expec.fulfill()
    }
    func registrationDidFailed(message: String) {}
}
