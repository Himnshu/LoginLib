//
//  LoginCoordinator.swift
//  LoginFramework
//
//  Created by OSX on 28/07/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import LoginLib

class LoginCoordinator: LoginLib.LoginCoordinator
{
    override func start() {
        super.start()
        configureAppearance()
    }
    
    override func finish() {
        super.finish()
    }
    
    func configureAppearance() {
        // Customize LoginKit. All properties have defaults, only set the ones you want.
        
        // Customize the look with background & logo images
        backgroundImage = #imageLiteral(resourceName: "background")
        mainLogoImage = #imageLiteral(resourceName: "parseImage")
        secondaryLogoImage = #imageLiteral(resourceName: "parseImage")
        
        // Change colors
        tintColor = UIColor(red: 52.0/255.0, green: 152.0/255.0, blue: 219.0/255.0, alpha: 1)
        errorTintColor = UIColor(red: 253.0/255.0, green: 227.0/255.0, blue: 167.0/255.0, alpha: 1)
        
        // Change placeholder & button texts, useful for different marketing style or language.
        loginButtonText = "Sign In"
        signupButtonText = "Create Account"
        forgotPasswordButtonText = "Forgot password?"
        recoverPasswordButtonText = "Recover"
        namePlaceholder = "Full Name"
        emailPlaceholder = "E-Mail"
        passwordPlaceholder = "Password!"
        repeatPasswordPlaceholder = "Confirm password!"
    }
    
    // MARK: - Completion Callbacks
    
    override func login(profile: LoginProfile) {
        // Handle login via your API
        print("Login with: email =\(profile.email) username = \(profile.userName)")
    }
    
    override func signup(profile: SignUpProfile) {
        // Handle signup via your API
        print("Signup with: name = \(profile.userName) email =\(profile.email)")
    }
    
    override func loginError(error: NSError) {
        // Handle login error via your API
        let errorString = error.userInfo["error"] as? String
        print("Error: \(errorString)")
    }
    
    override func signUpError(error: NSError) {
        // Handle login error via your API
        print(error)
    }
    
    override func enterWithFacebook(profile: FacebookProfile) {
        // Handle Facebook login/signup via your API
        print("Login/Signup via Facebook with: FB profile =\(profile)")
    }
    
    override func enterWithTwitter(profile: TwitterProfile) {
        // Handle Facebook login/signup via your API
        print("Login/Signup via Facebook with: FB profile =\(profile)")
    }
    
    override func recoverPassword(success: Bool) {
        // Handle password recovery via your API
        print(success)
    }
    
    override func recoverPasswordError(error: NSError) {
        print(error)
    }
}
