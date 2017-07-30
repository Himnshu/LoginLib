//
//  LoginService.swift
//  Pods
//
//  Created by Himanshu Mahajan on 26/07/17.
//


import Foundation

import Parse

public typealias LoginCompletion = (LoginResult) -> Void

public enum LoginResult {
    
    case success(LoginProfile)
    case error(Error)
    case missingPermissions
    case unknownError
    case cancelled
    
}

public struct LoginProfile {
    
    public let objectId: String
    
    public let userName: String
    
    public let email: String
    
    public let sessionToken: String
    
    public let user : PFUser
}

public class LoginService {
    
    public init() {}
    
    public func login(from viewController: UIViewController,username:String,password:String, completion: @escaping LoginCompletion) {
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) -> Void in
            if let error = error {
                print("Parse LOGIN: ERROR")
                print(error)
                completion(.error(error))
                return
            } else {
                print("Parse LOGIN: SUCCESS")
                self.getUserInfo(user: user! ,completion: completion)
            }
        }
    }
}

private extension LoginService {
    
    func getUserInfo(user : PFUser ,completion: @escaping LoginCompletion) {
        guard let email = user.email else {
            print("Parse: MISSING RESULT")
            completion(.unknownError)
            return
        }
        guard let sessionToken = user.sessionToken else {
            print("Parse: MISSING RESULT")
            completion(.unknownError)
            return
        }
        guard let username = user.username else {
            print("Parse: MISSING RESULT")
            completion(.unknownError)
            return
        }
        
        guard let objectId = user.objectId else {
            print("Parse: MISSING RESULT")
            completion(.unknownError)
            return
        }
        guard let user1 : PFUser = user else {
            print("Parse: MISSING RESULT")
            completion(.unknownError)
            return
        }
        
        let profile = LoginProfile(objectId: objectId,
                                     userName: username,
                                     email: email,
                                     sessionToken:sessionToken,
                                     user:user1)
        completion(.success(profile))
    }
    
}

