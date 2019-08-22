Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name         = "MopinionSDKWeb"
  s.version      = "0.3.4"
  s.summary      = "Mopinion iOS web SDK"
  s.ios.deployment_target  = '9.0'
  s.description  = "Mopinion mobile web SDK for iOS. Build dynamic customizable customer feedback forms for your iOS app."
  s.homepage     = "http://mopinion.com"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.license      = { :type => "MIT", :file => "LICENSE" }

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.authors      = { "Floris Snuif" => "floris@mopinion.com", "Anwar Jebali" => "anwar@mopinion.com", "Kees van Welsenis" => "kvwelsenis@mopinion.com" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.platform     = :ios, "9.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source = {:git => "https://github.com/mopinion/mopinion-sdk-ios-web.git", :tag => s.version}

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.ios.vendored_frameworks = 'MopinionSDK.framework'

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.framework  = "MopinionSDK"

end
