#
# Be sure to run `pod lib lint LoginLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LoginLib'
  s.version          = '0.1.0'
  s.summary          = 'LoginLib is a quick and easy way to add a Login/Signup UX to your app.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
LoginLib handles Signup & Login, via Facebook, Google, Twitter & Email using Parse. It takes care of the UI, the forms, validation, and Facebook SDK access, Google SDK access, Twitter SDK access.
                       DESC

  s.homepage         = 'https://github.com/Himnshu/LoginLib'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Himanshu mahajan' => 'hmahajan@athenasoft.in' }
  s.source           = { :git => 'https://github.com/Himnshu/LoginLib.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'LoginLib/Classes/**/*'
  s.resources = 'LoginLib/Assets/*.{xib,xcassets,png,jpg,otf,ttf}'
  
  # s.resource_bundles = {
  #   'LoginLib' => ['LoginLib/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
    s.dependency 'Validator', '~> 2.1.1'
    s.dependency 'FBSDKCoreKit', '4.22.0'
    s.dependency 'FBSDKLoginKit', '4.18.0'
    s.dependency 'ParseFacebookUtilsV4'
    s.dependency 'ParseTwitterUtils'
    s.dependency 'Parse', '1.14.2'
    s.dependency 'Bolts', '1.8.4'
end
