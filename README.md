# LicensePlistWindowController

`LicensePlistWindowController` is a implementation of displaying `LicensePlist` Settings.bundle file.

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
