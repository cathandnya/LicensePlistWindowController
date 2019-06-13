# LicensePlistWindowController

`LicensePlistWindowController` is a implementation of displaying `LicensePlist` Settings.bundle file.

![Screenshot](https://raw.githubusercontent.com/cathandnya/LicensePlistWindowController/master/screenshot.png)

## Cocoapods

`pod 'LicensePlistWindowController'`

## Usage

Create Settings.bundle. (ref: https://github.com/mono0926/LicensePlist )

Then, show `LicensePlistWindowController`.

```
let bundle = Bundle(url: Bundle.main.url(forResource: "Settings", withExtension: "bundle")!)!
let wc = LicensePlistWindowController.instantiate(info: bundle)!
wc.showWindow(nil)
```
