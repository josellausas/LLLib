#
# Be sure to run `pod lib lint LLLib.podspec` to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LLLib'
  s.version          = '0.1.0'
  s.summary          = 'Simplifies using CoreData and allows to dynamically create model schemas. (WORK IN PROGRESS)'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A toolbelt for iOS development. Simplifies using CoreData and allows to dynamically create model schemas. You can programatically create CoreData managed objects and manipulate them from external tools like React Native.
                       DESC

  s.homepage         = 'https://github.com/zunware/LLLib'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Zunware' => 'jose@zunware.com' }
  s.source           = { :git => 'https://github.com/zunware/LLLib.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LLLib/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LLLib' => ['LLLib/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
