#
#  Be sure to run `pod spec lint LXSwiftExtension.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "LXSwiftExtension"
  s.version      = "1.0.2"
  s.summary      = "iOS Extension in Swift"
  s.description  = <<-DESC
                  My iOS Extension collections in Swift.
                   DESC

  s.homepage     = "https://github.com/noblakit01/LXExtension"
  s.license      = "MIT"

  s.platform     = :ios, "9.0"

  s.author       = { "noblakit01" => "noblakit01@gmail.com" }
  
  s.source       = { :git => "https://github.com/noblakit01/LXExtension.git", :tag => s.version }

  s.source_files  = "Sources/*.swift"
  s.requires_arc = true

end
