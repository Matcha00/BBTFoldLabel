#
# Be sure to run `pod lib lint BBTFoldLabel.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BBTFoldLabel'
  s.version          = '0.1.4'
  s.summary          = '一个好用的折叠展开Label，OC版'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        一个好用的折叠展开Label，OC版，支持限制行数，展示展开折叠按钮，欢迎使用
                       DESC

  s.homepage         = 'https://github.com/Matcha00/BBTFoldLabel'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Matcha00' => 'chmatcha00@gmail.com' }
  s.source           = { :git => 'https://github.com/Matcha00/BBTFoldLabel.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.default_subspec = 'FoldLabel'
  
  # UI层‎⁨
  s.subspec 'FoldLabel' do |foldLabel|
    foldLabel.source_files = 'BBTFoldLabel/Classes/FoldLabel/*.{h,m}'
    foldLabel.dependency 'Masonry'
    foldLabel.dependency 'BBTFoldLabel/NSAttributedString'
  end
  
  # Services层
  s.subspec 'NSAttributedString' do |attributedString|
    attributedString.source_files = 'BBTFoldLabel/Classes/NSAttributedString/*.{h,m}'
    attributedString.dependency 'YYText'
    attributedString.dependency 'YYCategories'
  end
  # s.source_files = 'BBTFoldLabel/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BBTFoldLabel' => ['BBTFoldLabel/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
