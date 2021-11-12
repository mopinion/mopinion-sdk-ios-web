// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "0.5.0-RC-6"

let package = Package(
    name: "MopinionSDK",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MopinionSDK",
            targets: ["MopinionSDK"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        // enable if you want to test with a local package
//        .binaryTarget(
//            name: "MopinionSDK",
//            path: "MopinionSDK.xcframework")
	// Remote package. Must use https:// and .zip .Note: using file: for the URL won't load or link the binaryTarget.
       .binaryTarget(
       		name: "MopinionSDK",
       		url: "https://github.com/mopinion/spm-x/releases/download/0.5.0-swiftpm/MopinionSDK-0.5.0.xcframework.zip",
       		checksum: "8dff1a895f4229d8ff307a6c402d06fdbfff789dbe6897ae8f980371ae1e1eda")     
    ]
)

