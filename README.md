# Mopinion Mobile web SDK iOS

The Mopinion Mobile SDK can be used to collect feedback from iOS apps based on events.
To use Mopinion mobile web feedback forms in your app you can include the SDK as a Framework in your Xcode project.

Other Mopinion SDK's are also available:

- [iOS SDK (React Native required)](https://github.com/mopinion/mopinion-sdk-ios)
- [Android SDK (React Native required)](https://github.com/mopinion/mopinion-sdk-android)
- [Android web SDK](https://github.com/mopinion/mopinion-sdk-android-web)

## Release notes for version 0.4.6
### New features in 0.4.6
- The new method `evaluate()` and its asynchronous callback response `mopinionOnEvaluateHandler()` as part of the protocol `MopinionOnEvaluateDelegate` allow you to verify whether or not a form would be opened for a specified event. 
- The new method `openFormAlways()`, to be used with the response of the `mopinionOnEvaluateHandler()` method, allows you to open a form regardless of any proactive conditions set in the deployment.


## Install

The Mopinion Mobile SDK Framework can be installed by using the popular dependency manager [Cocoapods](https://cocoapods.org).

### Install Cocoapods

`$ sudo gem install cocoapods`

For Xcode 12.2, make a `Podfile` in root of your project:

```ruby
platform :ios, '9.0'
use_frameworks!
target '<YOUR TARGET>' do
	pod 'MopinionSDKWeb', '>= 0.4.6'
end
```

Install the needed pods:

`$ pod install`

After this you should use the newly made `<your-project-name>.xcworkspace` file to open in Xcode.


## Implement the SDK

In your app code, for instance the `AppDelegate.swift` file, put:

```swift
import MopinionSDK
...
// debug mode
MopinionSDK.load(<MOPINION DEPLOYMENT KEY>, true)
// live
MopinionSDK.load(<MOPINION DEPLOYMENT KEY>)
```

The `<MOPINION DEPLOYMENT KEY>` should be replaced with your specific deployment key. This key can be found in your Mopinion account at the `Feedback forms` section under `Deployments`.

in a UIViewController, for example `ViewController.swift`, put:

```swift
import MopinionSDK
...
MopinionSDK.event(self, "_button")
```
where `"_button"` is the default passive form event.
You can also make custom events and use them in the Mopinion deployment interface.  
In the Mopinion system you can enable or disable the feedback form when a user of your app executes the event.
The event could be a touch of a button, at the end of a transaction, proactive, etc.

## extra data

From version `0.3.1` it's also possible to send extra data from the app to your form. 
This can be done by adding a key and a value to the `data()` method.
The data should be added before the `event()` method is called if you want to include the data in the form that comes up for that event.

```swift
MopinionSDK.data(_ key: String, _ value: String)
```

Example:
```swift
import MopinionSDK
...
MopinionSDK.load("abcd1234")
...
MopinionSDK.data("first name", "Steve")
MopinionSDK.data("last name", "Jobs")
...
MopinionSDK.event(self, "_button")
```

Note: In the set of meta data, the keys are unique. If you re-use a key, the previous value for that key will be overwritten.

## clear extra data

From version `0.3.4` it's possible to remove all or a single key-value pair from the extra data previously supplied with the `data(key,value)` method.
To remove a single key-value pair use this method:

```swift
MopinionSDK.removeData(forKey: String)
```
Example:

```swift
MopinionSDK.removeData(forKey: "first name")
```

To remove all supplied extra data use this method without arguments:

```swift
MopinionSDK.removeData()
```
Example:

```swift
MopinionSDK.removeData()
```

## Evaluate if a form will open
The event() method of the SDK autonomously checks deployment conditions and opens a form, or not.

From SDK version `0.4.6` you can use the evaluate() and related methods to give your app more control on opening a form for proactive events or take actions when no form would have opened.

It can also be used on passive events, but such forms will always be allowed to open.

###Procedure overview

1. Call the `evaluate()` method and pass it the delegate object that implements the `MopinionOnEvaluateDelegate` protocol.
2. In your delegate's callback method `mopinionOnEvaluateHandler()`, check the response parameters and retrieve the `formKey` if there is any.
3. Optionally, pass the `formKey` to the method `openFormAlways()` to open your form directly, ignoring any conditions in the deployment.

### evaluate() method
Evaluates whether or not a form would have opened for the specified event. If without errors, the delegate object will receive the `mopinionOnEvaluateHandler()` call with the response.

```swift
public func evaluate( _ event: String, onEvaluateDelegate: MopinionOnEvaluateDelegate )

```
Parameters:

* `event`: The name of the event as definied in the deployment. For instance "_button".
* `onEvaluateDelegate `: The object implementing the `MopinionOnEvaluateDelegate` protocol to handle the `mopinionOnEvaluateHandler()` callback method.

### mopinionOnEvaluateHandler() method
Method where the app receives the response of the evaluate call. Defined by the `MopinionOnEvaluateDelegate` protocol. Note that in case of any system errors this may not be called at all.

```swift
func mopinionOnEvaluateHandler(hasResult: Bool, event: String, formKey: String?, response: [String : Any]?)
```
Parameters:

* `hasResult`: if true then the form identified by the formKey would have opened. If false then the form would not have opened and the formKey might be null in case no forms were found associated with the event.
* `event`: the original event name that was passed to the evaluate call to check in the deployment.
* `formKey`: identifying key of the first feedback form found associated with the event. Only one formKey will be selected even if multiple forms matched the event name in the deployment.
* `response`: optional dictionary object for extra response details on success/failure and forms. Reserved for future extensions.

### openFormAlways() method
Opens the form specified by the formkey, regardless of any proactive conditions set in the deployment.

```swift
public func openFormAlways(_ parentView: UIViewController,_ formKey: String) 
```
Parameters:

* `parentView`: Your UIViewController object that can act as a parent view controller for the SDK.
* `formKey`: key of a feedback form as provided by the mopinionOnEvaluateHandler() call.

###Example of using evaluate()
This snippet of pseudo code highlights the key points on how the aforementioned procedure fits together to implement the `MopinionOnEvaluateDelegate` protocol.

```swift
...
import MopinionSDK
...
// assuming that in your AppDelegate, you already did MopinionSDK.load(<MOPINION DEPLOYMENT KEY>)
...
class ViewController: UIViewController, MopinionOnEvaluateDelegate {
...
    func doSomething() {
        // check if a form would open                       
        MopinionSDK.evaluate("_myproactiveevent", onEvaluateDelegate: self)
        // the actual result will be in the mopinionOnEvaluateHandler call
	}
...
	// callback handler for protocol MopinionOnEvaluateDelegate
    func mopinionOnEvaluateHandler(hasResult: Bool, event: String, formKey: String?, response: [String : Any]?) {
        if(hasResult) {
            // at least one form was found and all optional parameters are non-null
            // because conditions can change every time, use the form key to open it directly
          	MopinionSDK.openFormAlways(self, formKey!)
        }else{
            if let _ = formKey {
				// Found form wouldn't open for event
				 // we'll open it anyway using the formKey             
				MopinionSDK.openFormAlways(self, formKey!)
            }else{
				// no form found for event
				...
            }
        }
    }
...
```

## Edit triggers

In the Mopinion deployment editor you can define event names and triggers that will work with the SDK event names that you used in your app.
Login to your Mopinion account and go to Data collection, Deployments to use this functionality.

The custom defined events can be used in combination with rules/conditions:

* trigger: `passive` or `proactive`. A passive form always shows when the event is triggered. A proactive form only shows once, you can set the refresh duration after which the form should show again. 
* submit: allow opening a proactive form until it has been submitted at least once. This affects the trigger rule, to allow opening a form more than once. Support for this appeared in SDK version 0.4.3.
* percentage (proactive trigger): % of users that should see the form  
* date: only show the form at at, after or before a specific date or date range  
* time: only show the form at at, after or before a specific time or time range  
* target: the OS the form should show (iOS or Android)  
