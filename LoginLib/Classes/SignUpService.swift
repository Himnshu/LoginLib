//
//  SignUpService.swift
//  Pods
//
//  Created by Himanshu Mahajan on 26/07/17.
//
//

import Foundation

import Parse

public typealias SignUpCompletion = (SignUpResult) -> Void

public enum SignUpResult {
    
    case success(SignUpProfile)
    case error(Error)
    case missingPermissions
    case unknownError
    case cancelled
    
}

public struct SignUpProfile {
    
    public let objectId: String
    
    public let userName: String
    
    public let email: String
    
    public let sessionToken: String
    
    public let user : PFUser
}

public class SignUpService {
    
    public init() {}
    
    public func login(from viewController: UIViewController,user:PFUser, completion: @escaping SignUpCompletion) {
        
        user.signUpInBackground {
            (succeeded, error) -> Void in
            if let error = error {
                print("Parse Signup: ERROR")
                print(error)
                completion(.error(error))
                return
            } else {
                print("Parse Signup: SUCCESS")
                self.getUserInfo(user: user ,completion: completion)
            }
        }
    }
}

private extension SignUpService {
    
    func getUserInfo(user : PFUser ,completion: @escaping SignUpCompletion) {
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
        
        let profile = SignUpProfile(objectId: objectId,
                                   userName: username,
                                   email: email,
                                   sessionToken:sessionToken,
                                   user:user1)
        completion(.success(profile))
    }
    
}


