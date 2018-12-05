Pod::Spec.new do |s|
  s.name             = 'STKitSwift'
  s.version          = '1.0'
  s.summary          = '快速开发'
  s.description      = '一些有用的类加快app开发，非常全面，是UIKit、Foundation的扩展'

  s.homepage         = 'https://github.com/STShenZhaoliang'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'shentian' => '409178030@qq.com' }

  s.source           = { :git => 'https://github.com/STShenZhaoliang/STKitSwift.git', :tag => s.version.to_s }

  s.swift_version         = '4.2'
  s.ios.deployment_target = '12.0'
  s.ios.source_files      = 'STKitSwift/*.swift'

end
