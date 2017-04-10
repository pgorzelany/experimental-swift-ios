source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '9.0'

use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

target 'ExperimentalSwift' do
    pod 'SwiftyJSON', '~>3.1.1'
    pod 'RxSwift', '~>3.0'
    pod 'RxCocoa', '~>3.0'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
      config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
      config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
    end
  end
end
