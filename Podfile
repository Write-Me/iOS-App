# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'
use_frameworks!

def firebase 
  	pod 'Firebase/Crashlytics', '8.9.1'
  	pod 'Firebase/Analytics', '8.9.1'
end 

def sharePods 
  	firebase()
	pod 'RealmSwift', '10.19.0'
end 

target 'WriteMe' do
	sharePods()
end

target 'WriteMeTests' do
	sharePods()
end

target 'WriteMeUITests' do
	sharePods()
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end
