#
# Be sure to run `pod lib lint ACProductPhotoGallery.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ACProductPhotoGallery'
  s.version          = '0.1.3'
  s.summary          = 'ACProductPhotoGallery is image gallery for e-commerce apps to show slide and show zoomable product pictures.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  To run the example project, clone the repo, and run `pod install` from the Example directory first.ACProductPhotoGallery is available through CocoaPods. To install
  it, simply add the following line to your Podfile: pod `ACProductPhotoGallery`
                       DESC

  s.homepage         = 'https://github.com/marcoaras/ACProductPhotoGallery'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'marcoaras' => 'cagliuzun.aras@gmail.com' }
  s.source           = { :git => 'https://github.com/marcoaras/ACProductPhotoGallery.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.swift_version = '4.2'
  s.ios.deployment_target = '9.0'
  s.requires_arc = true
  
  s.source_files = 'ACProductPhotoGallery/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ACProductPhotoGallery' => ['ACProductPhotoGallery/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'Kingfisher'
end
