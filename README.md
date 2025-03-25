# MapMetrics-iOS
1. Installation (CocoaPods)

Add this to your Podfile:
###ruby
target 'YourApp' do  
  pod 'MapMetrics', '~> 0.0.2'  # Use the latest version  
  
  OR

  pod 'MapMetrics', :git => 'https://github.com/hasnattariqusuf/MapMetrics-iOS.git', :tag => '0.0.1'
end


Run:
####bash
pod install  


2. Required Build Settings (Sandbox Fix)

To prevent rsync.samba deny(1) errors, users must add these settings:

Option A: Automatic Fix (via Podfile)

Add to your Podfile:

####ruby
post_install do |installer|  
  installer.pods_project.targets.each do |target|  
    target.build_configurations.each do |config|  
      # Disable sandbox restrictions  
      config.build_settings['ENABLE_USER_SCRIPT_SANDBOXING'] = 'NO'  
    end  
  end  
end  
Then run:

###bash
pod install  


Option B: Manual Fix (Xcode Settings)

Open your project in Xcode.
Go to:
Target → Build Settings → Search ENABLE_USER_SCRIPT_SANDBOXING.
Set to NO for all configurations (Debug/Release).
3. Verify Installation

Import in Code:
swift
import MapMetrics  
Clean Build (if issues persist):

###bash
rm -rf ~/Library/Developer/Xcode/DerivedData/*  

Troubleshooting

Issue	Solution
Sandbox deny(1) errors	Ensure ENABLE_USER_SCRIPT_SANDBOXING=NO is set.
pod install fails	Delete Pods/ and Podfile.lock, then retry.
Version conflicts	Run pod update MapMetrics.
Notes for End Users

Example Podfile (Complete)

###ruby
platform :ios, '12.0'  

target 'YourApp' do  
  use_frameworks!  
  pod 'MapMetrics', '~> 0.0.2'  

  post_install do |installer|  
    installer.pods_project.targets.each do |target|  
      target.build_configurations.each do |config|  
        config.build_settings['ENABLE_USER_SCRIPT_SANDBOXING'] = 'NO'  
      end  
    end  
  end  
end  
