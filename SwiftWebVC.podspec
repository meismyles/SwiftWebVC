#
# Be sure to run `pod lib lint SwiftWebVC.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftWebVC'
  s.version          = '0.3.5'
  s.summary          = 'SwiftWebVC is a simple inline browser for your Swift iOS app.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC

  SwiftWebVC is a simple inline browser for your Swift iOS app.

  SwiftWebVC features:
  * iPhone and iPad distinct UIs
  * Full landscape orientation support
  * Back, forward, stop/refresh and share buttons
  * Open in Safari and Chrome UIActivities
  * Navbar title set to the currently visible web page
  * Talks with setNetworkActivityIndicatorVisible
  * 3 different themes to choose from when presented modally
                       DESC

  s.homepage         = 'https://github.com/meismyles/SwiftWebVC'
  s.screenshots      = 'https://cloud.githubusercontent.com/assets/6603912/8509772/e1a1f2b6-22b0-11e5-878d-273b5b17b95a.png', 'https://cloud.githubusercontent.com/assets/6603912/8509773/e1a33ab8-22b0-11e5-93e4-c671934f55e5.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Myles Ringle' => 'meismyles@gmail.com' }
  s.source           = { :git => 'https://github.com/meismyles/SwiftWebVC.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'SwiftWebVC/**/*.swift'

  s.resources = 'SwiftWebVC/Resources/*'
  s.resource_bundles = {
    'SwiftWebVCResources' => ['SwiftWebVC/Resources/*']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
