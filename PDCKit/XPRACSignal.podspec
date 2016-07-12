#
#  Be sure to run `pod spec lint XPRACSignal.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "XPRACSignal"
  s.version      = "0.0.1"
  s.summary      = "A short description of XPRACSignal."
  s.description  = <<-DESC
  s.homepage     = "http://EXAMPLE/XPRACSignal"
  s.license      = "MIT (example)"
  s.author             = { "PDC" => "doublecheck@yeah.net" }
  s.source       = { :git => "http://EXAMPLE/XPRACSignal.git", :tag => "#{s.version}" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

end
