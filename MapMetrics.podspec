Pod::Spec.new do |spec|
  spec.name         = "MapMetrics"
  spec.version      = "0.0.1"
  spec.summary      = "MapMetrics SDK - A powerful mapping framework"
  spec.description  = "MapMetrics is a powerful tool that provides offline mapping capabilities with custom features."
  spec.homepage     = "https://github.com/hasnattariqusuf/MapMetrics-iOS"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Hasnat Tariq" => "hasnattariqusuf@gmail.com" }
  spec.platform     = :ios, "12.0"
    
  # Fixed: Changed 's.version' to 'spec.version'
  spec.source = {
    :git => "https://github.com/hasnattariqusuf/MapMetrics-iOS.git",
    :tag => spec.version.to_s
  }

  spec.vendored_frameworks = "MapMetrics.xcframework"

  # Prevent CocoaPods from moving or modifying the framework
  spec.preserve_paths = "MapMetrics.xcframework"
    spec.exclude_files = [
        '**/.DS_Store',
        '**/bazel-out',
        '**/*.lproj'
  ]


  # Ensures it is correctly embedded when installed
  spec.pod_target_xcconfig = {
    "EXCLUDED_ARCHS[sdk=iphonesimulator*]" => "arm64",
    "OTHER_LDFLAGS" => "-framework MapMetrics",
    "LD_RUNPATH_SEARCH_PATHS" => "@executable_path/Frameworks"
  }
  
  spec.frameworks = 'CoreLocation', 'OpenGLES', 'QuartzCore'

  spec.user_target_xcconfig = {
    "LD_RUNPATH_SEARCH_PATHS" => "@executable_path/Frameworks"
  }
end
