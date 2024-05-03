Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name         = "MopinionSDKWeb"
  s.version      = "0.7.2"
  s.summary      = "Mopinion iOS web SDK"
  s.description  = "Mopinion mobile web SDK for iOS. Build dynamic customizable customer feedback forms for your iOS app."
  s.homepage     = "https://mopinion.com"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.license      = { :type => "MIT", :file => "LICENSE.md" }

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.authors      = { "Floris Snuif" => "floris@mopinion.com", "Anwar Jebali" => "anwar@mopinion.com", "Kees van Welsenis" => "kvwelsenis@mopinion.com" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.platform     = :ios, "12.0"
  s.ios.deployment_target  = '12.0'

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source = {:git => "https://github.com/mopinion/mopinion-sdk-ios-web.git", :tag => s.version}
  s.changelog 	= "https://raw.githubusercontent.com/mopinion/mopinion-sdk-ios-web/master/CHANGELOG.md"
  s.readme 		= "https://raw.githubusercontent.com/mopinion/mopinion-sdk-ios-web/master/README.md"

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.ios.vendored_frameworks = 'MopinionSDK.xcframework'

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.framework  = "MopinionSDK"

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # preferred solution
  # s.xcconfig = { 'ONLY_ACTIVE_ARCH' => 'YES' }
end
