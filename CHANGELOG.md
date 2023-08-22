# 0.5.2
- Rebuilt with Xcode 14.1, tested on iOS 16.
- Dropped 32-bit support.
- CocoaPods minimum iOS version raised to 11.
- Brought forward the insertion of extra/meta data in the webform.
- Downloaded deployments are cached and only reloaded after least 30 minutes.

# 0.5.1
- Fixed an issue with iOS 15 where the extra/meta data and screenshot could disappear.

# 0.5.0
- SDK framework format converted to xcframework. 
- Support for Swift Package Manager 5.3, in github release 0.5.0-swiftpm.
- Support for iOS Simulator on ARM Macs.
- Introduced `MopinionCallbackEvents` for when a form is displayed, the user has submitted a form or when a form closed.

# 0.4.6
- New method `evaluate()` and its asynchronous callback response `mopinionOnEvaluateHandler()` as part of the protocol `MopinionOnEvaluateDelegate` to verify whether or not a form would be opened for a specified event. 
- New method `openFormAlways()`, to be used with the `mopinionOnEvaluateHandler()` method, to open a form regardless of any proactive conditions in the deployment.

# 0.4.5
- Removed deprecated UIWebView dependencies.

# 0.4.4
- Xcode 11.4 / Xcode 12 support.

# 0.4.3
- Autoclose of webforms.
- Allow weblinks to open browser.
- New trigger rule: submit-rule. Allows opening a proactive form until it has been submitted at least once.

# 0.4.2
- rebuilt with Xcode 11.2.1

# 0.4.1
- Swift 5.1.2 support.

# 0.4.0
- Swift 5.1/Xcode 11/iOS 13 support.

# 0.3.5
- Same as 0.4.0 but built for Swift 5.0/Xcode 10.3.

# 0.3.4
- New method `removeData()` to remove all or a single key-value pair from the extra data previously supplied with the data(key,value) method.
- Autolayout-fix for iOS11+.

# 0.3.3
- dismiss only localViewController.

# 0.3.1 
- New method `data()` to send extra data from the app to your form.