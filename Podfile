# Uncomment the next line to define a global platform for your project
 platform :ios, '9.0'
 source 'https://github.com/CocoaPods/Specs.git'

target 'TestAdding2' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TestAdding2
  pod 'TitanFramework'

end

post_install do |installer|
  
    auto_process_target(['TestAdding2'], 'TestAdding2', installer)
  
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
