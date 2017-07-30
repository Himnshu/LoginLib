//
//  FacebookService.swift
//  Pods
//
//  Created by Himanshu Mahajan on 26/07/17.
//
//

import Foundation
import FBSDKLoginKit

import ParseFacebookUtilsV4

public typealias FacebookCompletion = (FacebookResult) -> Void

public enum FacebookResult {

    case success(FacebookProfile)
    case error(Error)
    case missingPermissions
    case unknownError
    case cancelled

}

public struct FacebookProfile {

    public let facebookId: String

    public let facebookToken: String

    public let firstName: String

    public let lastName: String
    
    public let email: String

    public let profileUrl: String
    
    public var fullName: String {
        return firstName + " " + lastName
    }

}

public class FacebookService {

    let loginManager: FBSDKLoginManager = {
        let manager = FBSDKLoginManager()
        manager.loginBehavior = .systemAccount
        return manager
    }()

    let permissions = ["email", "public_profile"]

    public func login(from viewController: UIViewController, completion: @escaping FacebookCompletion) {
        
        var fbUtils: AnyClass = NSClassFromString("PFFacebookUtils")!
        if fbUtils.responds(to: Selector("logInWithPermissions:block:")) {
            // Facebook SDK v3 Login
            fbUtils.logInInBackground(withReadPermissions: permissions) { (user, error) -> Void in
                guard let user = user else {
                    if let error = error {
                        print("FACEBOOK LOGIN: ERROR")
                        print(error)
                        completion(.error(error))
                        return
                    } else {
                        print("FACEBOOK LOGIN: MISSING RESULT")
                        completion(.unknownError)
                        return
                    }
                }
                
                if user.isNew {
                    print("FACEBOOK LOGIN: SUCCESS")
                    print("PERMISSIONS: \(self.permissions)")
                    if self.permissions.contains("email") && self.permissions.contains("public_profile") {
                        print("FACEBOOK LOGIN: PERMISSIONS GRANTED")
                        self.getUserInfo(completion: completion)
                    } else {
                        print("FACEBOOK LOGIN: MISSING REQUIRED PERMISSIONS")
                        completion(.missingPermissions)
                    }
                } else {
                    print("FACEBOOK LOGIN: SUCCESS")
                    print("PERMISSIONS: \(self.permissions)")
                    if self.permissions.contains("email") && self.permissions.contains("public_profile") {
                        print("FACEBOOK LOGIN: PERMISSIONS GRANTED")
                        self.getUserInfo(completion: completion)
                    } else {
                        print("FACEBOOK LOGIN: MISSING REQUIRED PERMISSIONS")
                        completion(.missingPermissions)
                    }
                }
            }
            
            
//            PFFacebookUtils.logInInBackground(withReadPermissions: permissions) { (user, error) -> Void in
//                guard let user = user else {
//                    if let error = error {
//                        print("FACEBOOK LOGIN: ERROR")
//                        print(error)
//                        completion(.error(error))
//                        return
//                    } else {
//                        print("FACEBOOK LOGIN: MISSING RESULT")
//                        completion(.unknownError)
//                        return
//                    }
//                }
//                
//                if user.isNew {
//                    print("FACEBOOK LOGIN: SUCCESS")
//                    print("PERMISSIONS: \(self.permissions)")
//                    if self.permissions.contains("email") && self.permissions.contains("public_profile") {
//                        print("FACEBOOK LOGIN: PERMISSIONS GRANTED")
//                        self.getUserInfo(completion: completion)
//                    } else {
//                        print("FACEBOOK LOGIN: MISSING REQUIRED PERMISSIONS")
//                        completion(.missingPermissions)
//                    }
//                } else {
//                    print("FACEBOOK LOGIN: SUCCESS")
//                    print("PERMISSIONS: \(self.permissions)")
//                    if self.permissions.contains("email") && self.permissions.contains("public_profile") {
//                        print("FACEBOOK LOGIN: PERMISSIONS GRANTED")
//                        self.getUserInfo(completion: completion)
//                    } else {
//                        print("FACEBOOK LOGIN: MISSING REQUIRED PERMISSIONS")
//                        completion(.missingPermissions)
//                    }
//                }
//            }
        }
        else if fbUtils.responds(to: Selector("logInInBackgroundWithReadPermissions:block:")) {
            // Facebook SDK v4 Login
            fbUtils.logInInBackground(withReadPermissions: permissions) { (user, error) -> Void in
                guard let user = user else {
                    if let error = error {
                        print("FACEBOOK LOGIN: ERROR")
                        print(error)
                        completion(.error(error))
                        return
                    } else {
                        print("FACEBOOK LOGIN: MISSING RESULT")
                        completion(.unknownError)
                        return
                    }
                }
                
                if user.isNew {
                    print("FACEBOOK LOGIN: SUCCESS")
                    print("PERMISSIONS: \(self.permissions)")
                    if self.permissions.contains("email") && self.permissions.contains("public_profile") {
                        print("FACEBOOK LOGIN: PERMISSIONS GRANTED")
                        self.getUserInfo(completion: completion)
                    } else {
                        print("FACEBOOK LOGIN: MISSING REQUIRED PERMISSIONS")
                        completion(.missingPermissions)
                    }
                } else {
                    print("FACEBOOK LOGIN: SUCCESS")
                    print("PERMISSIONS: \(self.permissions)")
                    if self.permissions.contains("email") && self.permissions.contains("public_profile") {
                        print("FACEBOOK LOGIN: PERMISSIONS GRANTED")
                        self.getUserInfo(completion: completion)
                    } else {
                        print("FACEBOOK LOGIN: MISSING REQUIRED PERMISSIONS")
                        completion(.missingPermissions)
                    }
                }
            }
        }
        else {
            var error: NSError?
            NSException.raise(NSExceptionName.internalInconsistencyException, format:"Can't find PFTwitterUtils. Please link with ParseTwitterUtils to enable login with Twitter.", arguments:getVaList([error!]))
        }
        
        
        
//        PFFacebookUtils.logInInBackground(withReadPermissions: permissions) { (user, error) -> Void in
//            guard let user = user else {
//                if let error = error {
//                    print("FACEBOOK LOGIN: ERROR")
//                    print(error)
//                    completion(.error(error))
//                    return
//                } else {
//                    print("FACEBOOK LOGIN: MISSING RESULT")
//                    completion(.unknownError)
//                    return
//                }
//            }
//            
//            if user.isNew {
//                print("FACEBOOK LOGIN: SUCCESS")
//                print("PERMISSIONS: \(self.permissions)")
//                if self.permissions.contains("email") && self.permissions.contains("public_profile") {
//                    print("FACEBOOK LOGIN: PERMISSIONS GRANTED")
//                    self.getUserInfo(completion: completion)
//                } else {
//                    print("FACEBOOK LOGIN: MISSING REQUIRED PERMISSIONS")
//                    completion(.missingPermissions)
//                }
//            } else {
//                print("FACEBOOK LOGIN: SUCCESS")
//                print("PERMISSIONS: \(self.permissions)")
//                if self.permissions.contains("email") && self.permissions.contains("public_profile") {
//                    print("FACEBOOK LOGIN: PERMISSIONS GRANTED")
//                    self.getUserInfo(completion: completion)
//                } else {
//                    print("FACEBOOK LOGIN: MISSING REQUIRED PERMISSIONS")
//                    completion(.missingPermissions)
//                }
//            }
//        }
    
//        loginManager.logIn(withReadPermissions: permissions, from: viewController) { (result, error) in
//            guard let result = result else {
//                if let error = error {
//                    print("FACEBOOK LOGIN: ERROR")
//                    print(error)
//                    completion(.error(error))
//                    return
//                } else {
//                    print("FACEBOOK LOGIN: MISSING RESULT")
//                    completion(.unknownError)
//                    return
//                }
//            }
//
//            if result.isCancelled {
//                print("FACEBOOK LOGIN: CANCELLED")
//                completion(.cancelled)
//            } else {
//                print("FACEBOOK LOGIN: SUCCESS")
//                print("PERMISSIONS: \(result.grantedPermissions)")
//                if result.grantedPermissions.contains("email") && result.grantedPermissions.contains("public_profile") {
//                    print("FACEBOOK LOGIN: PERMISSIONS GRANTED")
//                    self.getUserInfo(loginResult: result, completion: completion)
//                } else {
//                    print("FACEBOOK LOGIN: MISSING REQUIRED PERMISSIONS")
//                    completion(.missingPermissions)
//                }
//            }
//        }
    }

}

private extension FacebookService {

    func getUserInfo(completion: @escaping FacebookCompletion) {
        guard FBSDKAccessToken.current() != nil else {
            print("FACEBOOK: NOT LOGGED IN: ABORTING")
            completion(.unknownError)
            return
        }

        let params = ["fields" : "id, name, email,picture.width(100).height(100)"]

        let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: params)
        _ = graphRequest?.start { (connection, result, error) in
            
            if error != nil {
                print("FACEBOOK: GRAPH REQUEST: ERROR")
                completion(.error(error!))
            }
            else{
                guard let userData = result as? [String : AnyObject] else {
                    print("FACEBOOK: GRAPH REQUEST: MISSING RESULT")
                    completion(.unknownError)
                    return
                }
                
                guard let userPicture = result as? [String : AnyObject] else {
                    print("FACEBOOK: GRAPH REQUEST: MISSING DATA")
                    completion(.unknownError)
                    return
                }
                
                guard let dict : [String : AnyObject] = userPicture["picture"] as! [String : AnyObject] else {
                    print("FACEBOOK: GRAPH REQUEST: MISSING DATA")
                    completion(.unknownError)
                    return
                }
                
                guard let data : [String : AnyObject] = dict["data"] as! [String : AnyObject]? else {
                    print("FACEBOOK: GRAPH REQUEST: MISSING DATA")
                    completion(.unknownError)
                    return
                }
                
                guard let url : String = data["url"] as! String? else {
                    print("FACEBOOK: GRAPH REQUEST: MISSING DATA")
                    completion(.unknownError)
                    return
                }
                
                guard let facebookId : String = userData["id"] as! String, let fullName : String = userData["name"] as! String, let email : String = userData["email"] as! String else {
                    print("FACEBOOK: GRAPH REQUEST: MISSING DATA")
                    completion(.unknownError)
                    return
                }
                
                let fullNameArray = fullName.components(separatedBy: " ")
                guard let firstName = fullNameArray.first, let lastName = fullNameArray.last else {
                    print("FACEBOOK: GRAPH REQUEST: MISSING DATA")
                    completion(.unknownError)
                    return
                }
                
                let facebookToken = FBSDKAccessToken.current().tokenString as String//loginResult.token.tokenString as String
                
                print("FACEBOOK: GRAPH REQUEST: SUCCESS")
                let profile = FacebookProfile(facebookId: facebookId,
                                              facebookToken: facebookToken,
                                              firstName: firstName,
                                              lastName: lastName,
                                              email: email,profileUrl:url)
                completion(.success(profile))
            }
            
            
//            guard let userData = result as? [String : String] else {
//                if let error = error {
//                    print("FACEBOOK: GRAPH REQUEST: ERROR")
//                    completion(.error(error))
//                    return
//                } else {
//                    print("FACEBOOK: GRAPH REQUEST: MISSING RESULT")
//                    completion(.unknownError)
//                    return
//                }
//            }
//            
//            guard let userPicture = result as? [String : AnyObject] else {
//                print("FACEBOOK: GRAPH REQUEST: MISSING DATA")
//                completion(.unknownError)
//                return
//            }
//            
//            guard let dict : [String : AnyObject] = userPicture["picture"] as! [String : AnyObject] else {
//                print("FACEBOOK: GRAPH REQUEST: MISSING DATA")
//                completion(.unknownError)
//                return
//            }
//            
//            guard let data : [String : AnyObject] = dict["data"] as! [String : AnyObject]? else {
//                print("FACEBOOK: GRAPH REQUEST: MISSING DATA")
//                completion(.unknownError)
//                return
//            }
//            
//            guard let url : String = data["url"] as! String? else {
//                print("FACEBOOK: GRAPH REQUEST: MISSING DATA")
//                completion(.unknownError)
//                return
//            }
//
//            guard let facebookId = userData["id"], let fullName = userData["name"], let email = userData["email"] else {
//                print("FACEBOOK: GRAPH REQUEST: MISSING DATA")
//                completion(.unknownError)
//                return
//            }
//
//            let fullNameArray = fullName.components(separatedBy: " ")
//            guard let firstName = fullNameArray.first, let lastName = fullNameArray.last else {
//                print("FACEBOOK: GRAPH REQUEST: MISSING DATA")
//                completion(.unknownError)
//                return
//            }
//
//            let facebookToken = FBSDKAccessToken.current().tokenString as String//loginResult.token.tokenString as String
//
//            print("FACEBOOK: GRAPH REQUEST: SUCCESS")
//            let profile = FacebookProfile(facebookId: facebookId,
//                                          facebookToken: facebookToken,
//                                          firstName: firstName,
//                                          lastName: lastName,
//                                          email: email,profileUrl:url)
//            completion(.success(profile))
        }
    }
    
}
