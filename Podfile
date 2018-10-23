# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'TestAdding2' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TestAdding2

#  pod 'Starscream', '~> 3.0.4'
pod 'GoogleWebRTC', '1.1.20621' #'~> 1.1.22700' #1.1.23621
pod 'Alamofire', '~> 4.4'
pod 'AppsFlyerFramework', '~> 4.8.5'
pod 'Crashlytics'
pod 'SwiftDate', '~> 4.5.1'

pod 'MBProgressHUD', '~> 1.1.0'
pod 'IQKeyboardManagerSwift'
pod 'FSCalendar'
pod 'Charts', '3.2.1'
pod 'AKMaskField'
pod 'FontBlaster', '4.1.0'
pod 'XCGLogger', '~> 6.1.0'
pod 'RxAlamofire'
pod 'RxCocoa', '~> 4.3.0'
pod 'Gloss', '~> 2.0'
pod 'Validator', '~> 3.1.1'
pod 'SnapKit', '~> 4.0.0'
pod 'InputMask'
pod 'YandexMobileMetricaPush', '~> 0.6.0'
pod 'UITextView+Placeholder'
pod 'HTTPLogger'
end

swift4 = ['SwiftDate', 'SnapKit']

post_install do |installer|
    installer.pods_project.targets.each do |target|
        
        if swift4.include?(target.name)
            swift_version = '4.0'
        end
                
        if swift_version
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = swift_version
            end
        end
    end
end
