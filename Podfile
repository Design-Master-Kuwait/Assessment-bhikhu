# Uncomment the next line to define a global platform for your project
 platform :ios, '14.0'

target 'Trivia Quiz' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Trivia Quiz
  #pod for Moya we willl use for handle network api
  #https://github.com/Moya/Moya
  pod 'Moya', '15.0.0'
  
  #pod for ProgressBar
  #https://github.com/SVProgressHUD/SVProgressHUD
  pod 'SVProgressHUD','2.2.5'

end


post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
      end
    end
  end
