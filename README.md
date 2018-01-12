# SwiftWebVC

SwiftWebVC is a simple inline browser for your Swift iOS app.

![SwiftWebVC](https://cloud.githubusercontent.com/assets/6603912/8509772/e1a1f2b6-22b0-11e5-878d-273b5b17b95a.png)

**SwiftWebVC features:**

* iPhone and iPad distinct UIs
* Full landscape orientation support
* Back, forward, stop/refresh and share buttons
* Open in Safari and Chrome UIActivities
* Navbar title set to the currently visible web page
* Talks with `setNetworkActivityIndicatorVisible`
* 3 different themes to choose from when presented modally

![SwiftWebVC](https://cloud.githubusercontent.com/assets/6603912/8509773/e1a33ab8-22b0-11e5-93e4-c671934f55e5.png)

## Installation

**CocoaPods**

* SwiftWebVC is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftWebVC'
```

**Carthage**

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate SwiftWebVC into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "meismyles/SwiftWebVC"
```

Run `carthage update` to build the framework and drag the built `SwiftWebVC.framework` into your Xcode project.

**Manual**

* Add the `SwiftWebVC/` folder into your project.

## Usage

Just like any UIViewController, SwiftWebVC can be pushed into a UINavigationController stack:

```swift
let webVC = SwiftWebVC(urlString: "http://google.com")
self.navigationController?.pushViewController(webVC, animated: true)
```

It can be presented modally using `SwiftModalWebVC`:

```swift
let webVC = SwiftModalWebVC(urlString: "http://google.com")
self.present(webVC, animated: true, completion: nil)
```

### Options

The share button can be disabled by passing a flag in to the constructor to specify this:
```swift
let webVC = SwiftWebVC(urlString: "http://google.com", sharingEnabled: false)
```
The same principal applies for the modal implementation also:
```swift
let webVC = SwiftModalWebVC(urlString: "http://google.com", sharingEnabled: false)
```

#### Modal Options Only
Themes may be chosen for the modal implementation. The default theme is `Light-Blue`. Other modal themes `Light-Black` and `Dark` may be chosen using one of the following instead:

```swift
let webVC = SwiftModalWebVC(urlString: "http://google.com", theme: .lightBlack)
let webVC = SwiftModalWebVC(urlString: "http://google.com", theme: .dark)
```



## Delegate (Start/Finish Loading Callbacks)

SwiftWebVC also includes a delegate protocol that allows you to implement `didStartLoading` and `didFinishLoading` functions to determine when loading starts and finishes.

_Note: This is currently only implemented for `SwiftWebVC`, **not** `SwiftModalWebVC`._

To implement this, after declaring your instance of `SwiftWebVC`, set it's delegate and implement the callback functions. For example:

**Inititalisation**

```swift
let webVC = SwiftWebVC(urlString: "https://www.google.com")
webVC.delegate = self
self.navigationController?.pushViewController(webVC, animated: true)
```

**Delegate Implementation**
```swift
extension ViewController: SwiftWebVCDelegate {
    
    func didStartLoading() {
        print("Started loading.")
    }
    
    func didFinishLoading(success: Bool) {
        print("Finished loading. Success: \(success).")
    }
}
```

### SwiftWebVCActivity

Starting in iOS 6 Apple uses `UIActivity` to let you show additional sharing methods in share sheets. `SwiftWebVC` comes with "Open in Safari" and "Open in Chrome" activities. You can easily add your own activity by subclassing `SwiftWebVCActivity` which takes care of a few things automatically for you. Have a look at the Safari and Chrome activities for implementation examples.Typed


## Credits

SwiftWebVC is a Swift implementation of [Sam Vermette's SVWebViewController](https://github.com/samvermette/SVWebViewController/). Code transcription, updates and changes were carried out by Myles Ringle. The original SVWebViewController was brought to you by [Sam Vermette](http://samvermette.com) and [contributors to the project](https://github.com/samvermette/SVWebViewController/contributors).

If you have feature suggestions or bug reports, feel free to help out by sending pull requests or by [creating new issues](https://github.com/meismyles/SwiftWebVC/issues/new). If you're using SwiftWebVC in your project, attribution is always appreciated.

Thanks to [Icons8](https://icons8.com/) for the images.
