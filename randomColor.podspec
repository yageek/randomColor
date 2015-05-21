Pod::Spec.new do |s|
  s.name         = "randomColor"
  s.version      = "1.0.0"
  s.summary      = "A port of randomColor in Objective-C"

  s.description  = <<-DESC
                   A port of randomColor in Objective-C

                   * Port inspired by javascript and swift version
                   DESC

  s.homepage     = "https://github.com/yageek/randomColor"
  s.license      = "MIT"
  s.author             = { "Yannick heinrich" => "yannick.heinrich@gmail.com" }
  s.social_media_url   = "http://twitter.com/yageek"
  s.ios.deployment_target = "5.0"
  s.osx.deployment_target = "10.7"
  s.source       = { :git => "https://github.com/yageek/randomColor.git", :tag => "1.0.0" }
  s.osx.source_files  = "Classes/YGColorDefinition.{h,m}", "Classes/OSX/**/*.{h,m}"
  s.ios.source_files  = "Classes/YGColorDefinition.{h,m}", "Classes/iOS/**/*.{h,m}"
  s.osx.public_header_files = "Classes/YGColorDefinition.h", "Classes/OSX/**/*.h"
  s.ios.public_header_files = "Classes/YGColorDefinition.h", "Classes/iOS/**/*.h"
  s.ios.framework  = "UIKit"
  s.osx.framework  = "Cocoa"
  s.requires_arc = true
  s.xcconfig = { "OTHER_LDFLAGS" => "-ObjC" }

end
