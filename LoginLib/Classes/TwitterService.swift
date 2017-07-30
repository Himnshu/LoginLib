//
//  TwitterService.swift
//  Pods
//
//  Created by Himanshu Mahajan on 26/07/17.
//
//

import Foundation

import ParseTwitterUtils


public typealias TwitterCompletion = (TwitterResult) -> Void

public enum TwitterResult {
    
    case success(TwitterProfile)
    case error(Error)
    case missingPermissions
    case unknownError
    case cancelled
    
}

public struct TwitterProfile {
    
    public let userId: String
    
    public let authToken: String
    
    public let screenName: String
    
    public let userName: String
    
    public let email: String
    
    public let sessionToken: String
    
}

public class TwitterService {
    
    public func login(from viewController: UIViewController, completion: @escaping TwitterCompletion) {
        
        var twitterUtils: AnyClass = NSClassFromString("PFTwitterUtils")!
        if twitterUtils != nil {
            PFTwitterUtils.logIn
                {(user, error) -> Void in
                    
                    guard let user = user else {
                        if let error = error {
                            print("TWITTER LOGIN: ERROR")
                            print(error)
                            completion(.error(error))
                            return
                        } else {
                            print("TWITTER LOGIN: MISSING RESULT")
                            completion(.unknownError)
                            return
                        }
                    }
                    
                    if user.isNew {
                        print("TWITTER LOGIN: SUCCESS")
                        self.getUserInfo(user: user ,completion: completion)
                    } else {
                        print("FACEBOOK LOGIN: SUCCESS")
                        self.getUserInfo(user: user ,completion: completion)
                    }
            }
        }
        else {
            
            var error: NSError?
            NSException.raise(NSExceptionName.internalInconsistencyException, format:"Can't find PFTwitterUtils. Please link with ParseTwitterUtils to enable login with Twitter.", arguments:getVaList([error!]))
        }
        
//        PFTwitterUtils.logIn
//            {(user, error) -> Void in
//                
//                guard let user = user else {
//                    if let error = error {
//                        print("TWITTER LOGIN: ERROR")
//                        print(error)
//                        completion(.error(error))
//                        return
//                    } else {
//                        print("TWITTER LOGIN: MISSING RESULT")
//                        completion(.unknownError)
//                        return
//                    }
//                }
//                
//                if user.isNew {
//                    print("TWITTER LOGIN: SUCCESS")
//                    self.getUserInfo(user: user ,completion: completion)
//                } else {
//                    print("FACEBOOK LOGIN: SUCCESS")
//                    self.getUserInfo(user: user ,completion: completion)
//                }
//        }
    }
}

private extension TwitterService {
    
    func getUserInfo(user : PFUser ,completion: @escaping TwitterCompletion) {
        guard user.isAuthenticated != nil else {
            print("Twitter: NOT LOGGED IN: ABORTING")
            completion(.unknownError)
            return
        }
        
        guard let email = user.email else {
            print("Twitter: GRAPH REQUEST: MISSING RESULT")
            completion(.unknownError)
            return
        }
        guard let sessionToken = user.sessionToken else {
            print("Twitter: GRAPH REQUEST: MISSING RESULT")
            completion(.unknownError)
            return
        }
        guard let username = user.username else {
            print("Twitter: GRAPH REQUEST: MISSING RESULT")
            completion(.unknownError)
            return
        }
        
        guard let screenName = (PFTwitterUtils.twitter()?.screenName!) else {
            print("Twitter: GRAPH REQUEST: MISSING RESULT")
            completion(.unknownError)
            return
        }
        guard let userId = (PFTwitterUtils.twitter()?.userId) else {
            print("Twitter: GRAPH REQUEST: MISSING RESULT")
            completion(.unknownError)
            return
        }
        guard let authToken = (PFTwitterUtils.twitter()?.authToken) else {
            print("Twitter: GRAPH REQUEST: MISSING RESULT")
            completion(.unknownError)
            return
        }
    
        let profile = TwitterProfile(userId: userId,
                                      authToken: authToken,
                                      screenName: screenName,
                                      userName: username,
                                      email: email,
                                      sessionToken:sessionToken)
        completion(.success(profile))
    }
    
}

