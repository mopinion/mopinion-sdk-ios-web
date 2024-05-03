// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let githubReleaseDir = "0.7.2-swiftpm"
let sdkVersion = "0.7.2"
let sdkZipfileChecksum = "4c5620c016f5e7187222db052ffaf2a825b59d8ff384cc068b079290fb0a734b"

let package = Package(
    name: "MopinionSDK",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MopinionSDK",
            targets: ["MopinionSDK"]),
    ],
    targets: [
       .binaryTarget(
       		name: "MopinionSDK",
       		url: "https://github.com/mopinion/mopinion-sdk-ios-web/releases/download/\(githubReleaseDir)/MopinionSDK-\(sdkVersion).xcframework.zip",
       		checksum: sdkZipfileChecksum )     
    ]
)

