#
#  Be sure to run 'pod spec lint InMobiSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

# ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  These will help people to find your library, and whilst it
#  can feel like a chore to fill in it's definitely to your advantage. The
#  summary should be tweet-length, and the description more in depth.
#

s.name         = "VikasSDK"
s.version      = "9.1.1"
s.summary      = "VikasSDK"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
s.description  = <<-DESC
VikasSDK for more information.
DESC

s.homepage     = "https://www.inmobi.com"

# ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  Licensing your code is important. See http://choosealicense.com for more info.
#  CocoaPods will detect a license file if there is a named LICENSE*
#  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
#

s.license      = "Custom"

# ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  Specify the authors of the library, with email addresses. Email addresses
#  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
#  accepts just a name if you'd rather not provide an email address.
#
#  Specify a social_media_url where others can refer to, for example a twitter
#  profile URL.
#

s.author             = { "InMobi" => "jangirtony2009@inmobi.com" }

# ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  If this Pod runs only on iOS or OS X, then specify the platform and
#  the deployment target. You can optionally include the target after the platform.
#

s.platform     = :ios

#  When using multiple platforms
s.ios.deployment_target = "9.0"

# ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  Specify the location from where the source should be retrieved.
#  Supports git, hg, bzr, svn and HTTP.
#

s.source        = { :http => "https://github.com/jangirtony2009/XCFrameworkTest/blob/main/InMobi-iOS-SDK-9.1.1.zip"}

# ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  CocoaPods is smart about how it includes source code. For source files
#  giving a folder will include any swift, h, m, mm, c & cpp files.
#  For header files it will include any header in the folder.
#  Not including the public_header_files will make all headers public.
#


s.preserve_paths = "InMobiSDK.xcframework"

# ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  Link your library with frameworks, or libraries. Libraries do not include
#  the lib prefix of their name.
#
s.frameworks = "AdSupport", "AudioToolbox", "AVFoundation", "CoreTelephony", "CoreLocation", "Foundation", "MediaPlayer", "MessageUI", "StoreKit", "Social", "SystemConfiguration", "Security", "SafariServices", "UIKit"

s.weak_frameworks = "WebKit"

s.libraries = "sqlite3.0", "z"

s.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }

# ――― Creating subspecs ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  Creating two subspecs 
#  Default subspec "InMobiSDK" will have Core as well as Moat SDK
#  "Core": InMobiSDK without moat sdk
#  "moat": InMobiSDK with moat sdk
#

s.default_subspecs = 'InMobiSDK'

s.subspec 'InMobiSDK' do |sdk|
    sdk.dependency              'InMobiSDK/Core'
    sdk.dependency              'InMobiSDK/Moat'
end

s.subspec 'Core' do |core|
    core.vendored_frameworks = "InMobiSDK.xcframework"
end

s.subspec 'Moat' do |moat|
    moat.dependency             'InMobiSDK/Core'
    moat.vendored_frameworks  = "INMMoatMobileAppKit.framework"
    moat.preserve_paths = "INMMoatMobileAppKit.framework"
end

end
