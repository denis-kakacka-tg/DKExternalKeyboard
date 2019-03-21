#
# Be sure to run `pod lib lint DKExternalKeyboard.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DKExternalKeyboard'
  s.version          = '0.1.0'
  s.summary          = 'Keyboard for external displays.'

  s.description      = <<-DESC
  This pod allows user to show keyboard on external displays, where system keyboard cannot be showed.
                       DESC

  s.homepage         = 'https://github.com/deniskakacka/DKExternalKeyboard'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'deniskakacka' => 'deniskakacka@gmail.com' }
  s.source           = { :git => 'https://github.com/deniskakacka/DKExternalKeyboard.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'DKExternalKeyboard/Classes/**/*'
  
  s.resource_bundles = {
      'DKExternalKeyboard' => ['DKExternalKeyboard/Assets/**/*.{xib,pdf,xcassets}']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
