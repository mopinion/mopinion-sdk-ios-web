Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name         = "MopinionSDKWeb"
  s.version      = "0.1.0"
  s.summary      = "Mopinion iOS web SDK"
  s.ios.deployment_target  = '9.0'
  s.description  = "Mopinion mobile web SDK for iOS. Build dynamic customizable customer feedback forms for your iOS app."
  s.homepage     = "http://mopinion.com"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.license      = { :type => "MIT", :file => "LICENSE" }

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.authors      = { "Floris Snuif" => "floris@mopinion.com", "Anwar Jebali" => "anwar@mopinion.com" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.platform     = :ios, "9.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source = {:git => "https://github.com/mopinion/mopinion-sdk-ios-git.git", :tag => s.version}

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.ios.vendored_frameworks = 'MopinionSDKWeb.framework'

  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.resources = "MopinionSDKWeb.framework/main.jsbundle", "MopinionSDKWeb.framework/*.ttf"

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.framework  = "MopinionSDKWeb"

end
