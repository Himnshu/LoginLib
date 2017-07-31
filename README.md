# LoginLib

[![CI Status](http://img.shields.io/travis/himanshumahajan68@gmail.com/LoginLib.svg?style=flat)](https://travis-ci.org/Himanshu Mahajan/LoginLib)
[![Version](https://img.shields.io/cocoapods/v/LoginLib.svg?style=flat)](http://cocoapods.org/pods/LoginLib)
[![License](https://img.shields.io/cocoapods/l/LoginLib.svg?style=flat)](http://cocoapods.org/pods/LoginLib)
[![Platform](https://img.shields.io/cocoapods/p/LoginLib.svg?style=flat)](http://cocoapods.org/pods/LoginLib)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

LoginLib is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LoginLib', :git => 'https://github.com/Himnshu/LoginLib.git', :tag => '0.1.0'
```

## Getting Started

### Login Coordinator

Everything is handled through the **LoginCoordinator** class. You insantiate it and pass the root view controller which is the UIViewController from which the LoginLib process will be started (presented) on. This will usually be self.

```swift
import ParseFacebookUtilsV4

import ParseTwitterUtils

import Parse

class AppDelegate: UIResponder, UIApplicationDelegate {

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
// Override point for customization after application launch.

Parse.setApplicationId("124fgoewtijoewiotrewjio3432kdsfgkd", clientKey: "442jkfkldskldgkldskgldshklgkdsggsd")

PFFacebookUtils.initializeFacebook(applicationLaunchOptions: launchOptions)

PFTwitterUtils.initialize(withConsumerKey: "djgfdlskgbdjsklgbjdsgbjds", consumerSecret:"djksgjdksgjkdsgjkdsjkgdsjkgsdjkgdjksgjkdsgjkdsgkj")

return true
}

func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool
{
let handled = FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
// Add any custom logic here.
return handled
}




import LoginLib

class ViewController: UIViewController { 

lazy var loginCoordinator: LoginCoordinator = {
return LoginCoordinator(rootViewController: self)
}()

override func viewDidLoad() {
super.viewDidLoad()
// Do any additional setup after loading the view, typically from a nib.
}

override func viewDidAppear(_ animated: Bool) {
loginCoordinator.start()
}

override func didReceiveMemoryWarning() {
super.didReceiveMemoryWarning()
// Dispose of any resources that can be recreated.
}

...

}
```

Afterwards call start on the coordinator. That's it!

### Customization

Of course you will want to customize the Login Coordinator to be able to supply your own UI personalization, and to perform the necessary actions on login or signup.

That is done by subclassing the LoginCoordinator class.

```swift

class LoginCoordinator: LoginLib.LoginCoordinator {

}

```

### Start

Handle anything you want to happen when LoginLib starts. Make sure to call super.

```swift
override func start() {
super.start()
configureAppearance()
}
```

### Configuration

You can set any of these properties on the superclass to change the way LoginLib looks. Besides the images, all other properties have defaults, no need to set them if you don't need them.

| Property  |  Effect      |
|----------|:-------------:|
| backgroundImage |  The background image that will be used in all ViewController's.  | 
| mainLogoImage |  A logo image that will be used in the initial ViewController.  | 
| secondaryLogoImage |  A smaller logo image that will be used on all ViewController's except the initial one.  | 
| tintColor |  The tint color for the button text and background color.  | 
| errorTintColor |  The tint color for error texts. | 
| loginButtonText |  The text for the login button.  | 
| signupButtonText |  The text for the signup button.  | 
| forgotPasswordButtonText |  The text for the forgot password button.  | 
| recoverPasswordButtonText |  The text for the recover password button.  | 
| namePlaceholder |  The placeholder that will be used in the name text field.  | 
| emailPlaceholder |  The placeholder that will be used in the email text field.  | 
| passwordPlaceholder |  The placeholder that will be used in the password text field.  | 
| repeatPasswordPlaceholder |  The placeholder that will be used in the repeat password text field.  | 

```swift
// Customize LoginFramework. All properties have defaults, only set the ones you want.
func configureAppearance() {
// Customize the look with background & logo images
backgroundImage = 
mainLogoImage =
secondaryLogoImage =

// Change colors
tintColor = UIColor(red: 52.0/255.0, green: 152.0/255.0, blue: 219.0/255.0, alpha: 1)
errorTintColor = UIColor(red: 253.0/255.0, green: 227.0/255.0, blue: 167.0/255.0, alpha: 1)

// Change placeholder & button texts, useful for different marketing style or language.
loginButtonText = "Sign In"
signupButtonText = "Create Account"
forgotPasswordButtonText = "Forgot password?"
recoverPasswordButtonText = "Recover"
namePlaceholder = "Name"
emailPlaceholder = "E-Mail"
passwordPlaceholder = "Password!"
repeatPasswordPlaceholder = "Confirm password!"
}
```

### Completion Callbacks

Override these other 8 callback methods to handle what happens after the user tries to login, loginError, signup, signupError, recover password or recoverPasswordError or enter with facebook or enter with twitter.

Here you would call your own API.

```swift
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
// Handle signup error via your API
print(error)
}

override func enterWithFacebook(profile: FacebookProfile) {
// Handle Facebook login/signup via your API
print("Login/Signup via Facebook with: FB profile =\(profile)")
}

override func enterWithTwitter(profile: TwitterProfile) {
// Handle Twitter login/signup via your API
print("Login/Signup via twitter with: Twitter profile =\(profile)")
}

override func recoverPassword(success: Bool) {
// Handle password recovery via your API
print(success)
}

override func recoverPasswordError(error: NSError) {
// Handle password recovery Error via your API
print(error)
}

### Finish

After successfull login call the finish() method on LoginCoordinator. Be sure to call super.

```swift
override func finish() {
super.finish()
}
```


## Author

Himanshu Mahajan, Himanshumahajan68@gmail.com

## License

LoginLib is available under the MIT license. See the LICENSE file for more info.
