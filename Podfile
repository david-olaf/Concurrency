source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'

target 'AeonLMS' do

  pod 'Alamofire'
  pod 'SVProgressHUD'

  use_frameworks!

  # Pods for AeonLMS

  target 'AeonLMSTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'AeonLMSUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end