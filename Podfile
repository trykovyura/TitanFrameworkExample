# Uncomment the next line to define a global platform for your project
 platform :ios, '11.0'
 source 'https://github.com/CocoaPods/Specs.git'
 use_frameworks!

 abstract_target 'Renhealth' do
   # Utils
   pod 'SwiftLint', '~> 0.30.1'
   pod 'R.swift', '~> 5.0.2'
   pod 'Swinject', '~> 2.5.0'
   pod 'SwiftDate', '~> 5.0.13'

   # UI
   pod 'MaterialComponents/TextFields', '~> 77.0.0'
   pod 'MaterialComponents/TextFields+ColorThemer', '~> 77.0.0'
   pod 'MaterialComponents/TextFields+TypographyThemer', '~> 77.0.0'
   pod 'MaterialComponents/PageControl', '~> 77.0.0'
   pod 'lottie-ios', '~> 2.5.2'
   pod 'NotificationBannerSwift', '~> 2.0.1'
   pod 'SVProgressHUD', '~> 2.2.5'
   pod 'SnapKit', '~> 4.2.0'
   pod 'Kingfisher', '~> 5.3.1'
   pod 'Validator', '~> 3.1.1'
   pod 'IGListKit', '~> 3.4.0'
   pod 'SwiftRichString', '~> 2.1.0'
   pod 'SkeletonView', '~> 1.4.2'
   pod 'IQKeyboardManagerSwift', '~> 6.4.0'
   pod 'DrawerKit', '~> 0.7.0'

   # Map
   pod 'GoogleMaps', '~> 2.7.0'

   # Storage
   pod 'KeychainAccess', '~> 3.1.2'

   # Network
   pod 'Moya/RxSwift', '~> 12.0.1'

   # Analytics
   pod 'Fabric', '~> 1.9.0'
   pod 'Firebase/Core', '~> 5.2.0'
   pod 'Crashlytics', '~> 3.12.0'
   pod 'GoogleTagManager', '~> 7.0.0'

   # Rx
   pod 'RxSwift',  '~> 4.0'
   pod 'RxCocoa',  '~> 4.0'
   pod 'RxDataSources',  '~> 3.0'
   pod 'RxOptional', '~> 3.6.2'
   pod 'NSObject+Rx',  '~> 4.4.1'
   pod 'RxSwiftExt', '~> 3.4.0'
   pod 'RxMediaPicker', :git => 'https://github.com/MasterWatcher/RxMediaPicker'
   pod 'RxBiBinding', '~> 0.1.7'
   pod 'RxAtomic', '~> 4.4.2'
   pod 'RxFlow', '~> 2.2.0'
   pod 'RxCoreLocation', '~> 1.3.2'

   # Pods for TestAdding2
   pod 'TitanFramework', '1.4.9-dev'

   target 'TestAdding2'
 end

post_install do |installer|
  
    auto_process_target(['TestAdding2'], 'Renhealth-TestAdding2', installer)
  
end

def auto_process_target(app_target_names, embedded_target_name, installer)
  words = find_words_at_embedded_target('Pods-' + embedded_target_name,
                                        installer)
  handle_app_targets(app_target_names.map{ |str| 'Pods-' + str }, words, installer)
end

def find_line_with_start(str, start)
  str.each_line do |line|
    if line.start_with?(start)
      return line
    end
  end
  return nil
end

def remove_words(str, words)
  new_str = str
  words.each do |word|
    new_str = new_str.sub(word, '')
  end
  return new_str
end

def find_words_at_embedded_target(target_name, installer)
  puts "target_name = #{target_name}"
  target = installer.pods_project.targets.find { |target| target.name == target_name }
  target.build_configurations.each do |config|
    xcconfig_path = config.base_configuration_reference.real_path
    xcconfig = File.read(xcconfig_path)
    old_line = find_line_with_start(xcconfig, "OTHER_LDFLAGS")
    
    if old_line == nil
      next
    end
    words = old_line.split(' ').select{ |str| !str.start_with?("-l") && str != ("OTHER_LDFLAGS") && str != ("=") && str != ("$(inherited)") && str != ("-ObjC") }.map{ |str| ' ' + str }

    puts "=> words = >[#{words}]<"
    return words
  end
end

def handle_app_targets(names, words, installer)
  installer.pods_project.targets.each do |target|
    if names.index(target.name) == nil
      next
    end
    target.build_configurations.each do |config|
      xcconfig_path = config.base_configuration_reference.real_path
      xcconfig = File.read(xcconfig_path)
      old_line = find_line_with_start(xcconfig, "OTHER_LDFLAGS")

      if old_line == nil
        next
      end
      new_line = remove_words(old_line, words)
      
      new_xcconfig = xcconfig.sub(old_line, new_line)
      File.open(xcconfig_path, "w") { |file| file << new_xcconfig }
    end
  end
end
