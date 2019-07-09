Pod::Spec.new do |s|
  s.name             = 'STKitSwift'
  s.version          = '1.1'
  s.summary          = '快速开发'
  s.description      = '一些有用的类加快app开发，非常全面，是UIKit、Foundation的扩展'

  s.homepage         = 'https://github.com/STShenZhaoliang'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'shentian' => '409178030@qq.com' }

  s.source           = { :git => 'https://github.com/STShenZhaoliang/STKitSwift.git', :tag => s.version.to_s }

  s.swift_version         = '5'
  s.ios.deployment_target = '12.0'
  
  s.ios.dependency 'SnapKit'
  s.requires_arc = true

  s.default_subspec = 'STKit'
  
  s.subspec 'STKit' do |stkit|
    stkit.source_files = 'STKitSwift/*.swift'
    stkit.resource_bundles = {
      'STKitSwift_bundles' => ['STKitSwift/*.xcassets']
    }
  end
  
  s.subspec 'STAlertView' do |stalertview|
    stalertview.source_files = 'STKitSwift/STAlertView.swift', 'STKitSwift/UIViewController+STKit.swift'
  end
  
  s.subspec 'STGradientButton' do |stgradientbutton|
    stgradientbutton.source_files = 'STKitSwift/STGradientButton.swift'
  end
  
  s.subspec 'STGradientView' do |stgradientview|
    stgradientview.source_files = 'STKitSwift/STGradientView.swift'
  end
  
  s.subspec 'STHUD' do |sthub|
    sthub.source_files = 'STKitSwift/STHUD.swift'
  end
  
  s.subspec 'STMoveButton' do |stmovebutton|
    stmovebutton.source_files = 'STKitSwift/STMoveButton.swift'
  end
  
  s.subspec 'STPhoneTextField' do |stphonetextfield|
    stphonetextfield.source_files = 'STKitSwift/STPhoneTextField.swift'
  end
  
  s.subspec 'STProgressView' do |stprogressview|
    stprogressview.source_files = 'STKitSwift/STProgressView.swift'
  end
  
  s.subspec 'STSegmentedControl' do |stsegmentedcontrol|
    stsegmentedcontrol.source_files = 'STKitSwift/STSegmentedControl.swift', 'STKitSwift/UIView+STKit.swift'
  end
  
end

