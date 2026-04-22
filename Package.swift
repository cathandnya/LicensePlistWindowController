// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "LicensePlistWindowController",
    platforms: [
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "LicensePlistWindowController",
            targets: ["LicensePlistWindowController"]
        ),
    ],
    targets: [
        .target(
            name: "LicensePlistWindowController",
            path: "LicensePlistWindowController/LicensePlistWindowController",
            exclude: ["Info.plist", "LicensePlistWindowController.h"]
        ),
    ]
)
