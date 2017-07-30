//
//  PasswordRecoverService.swift
//  Pods
//
//  Created by Himanshu Mahajan on 26/07/17.
//
//

import Foundation

import Parse

public typealias PasswordCompletion = (PasswordResult) -> Void

public enum PasswordResult {
    
    case success(success : Bool)
    case error(Error)
    case missingPermissions
    case unknownError
    case cancelled
    
}

public class PasswordRecoverService {
    
    public init() {}
    
    public func resetPassword(from viewController: UIViewController,emailAddress : String, completion: @escaping PasswordCompletion) {
        
        PFUser.requestPasswordResetForEmail(inBackground: emailAddress, block: {(success,error) -> Void in
            if let error = error {
                print("Parse Reset: ERROR")
                print(error)
                completion(.error(error))
                return
            } else {
                print("Parse Reset: SUCCESS")
                completion(.success(success: true))
            }
        })
    }
}
