# LicensePlistWindowController

![version](https://img.shields.io/cocoapods/v/LicensePlistWindowController.svg?style=flat)
![platform](https://img.shields.io/cocoapods/p/LicensePlistWindowController.svg?style=flat)
![license](https://img.shields.io/cocoapods/l/LicensePlistWindowController.svg?style=flat)

`LicensePlistWindowController` is a implementation of displaying `LicensePlist` Settings.bundle file on __macos__.

![Screenshot](https://raw.githubusercontent.com/cathandnya/LicensePlistWindowController/master/screenshot.png)

## Swift Package Manager

In Xcode, choose File > Add Package Dependencies... and enter the repository URL:

```
https://github.com/cathandnya/LicensePlistWindowController.git
```

Or add it to `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/cathandnya/LicensePlistWindowController.git", from: "1.2.0"),
]
```

## Cocoapods

`pod 'LicensePlistWindowController'`

> [!NOTE]
> CocoaPods Trunk becomes read-only in December 2026, so 1.2.0 is the last version published to CocoaPods. Future releases will be available only via Swift Package Manager.

## Usage

Create Settings.bundle. (ref: https://github.com/mono0926/LicensePlist )

Then, show `LicensePlistWindowController`.

```
let bundle = Bundle(url: Bundle.main.url(forResource: "Settings", withExtension: "bundle")!)!
let wc = LicensePlistWindowController.instantiate(info: bundle)!
wc.showWindow(nil)
```
