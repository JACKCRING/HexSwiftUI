// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HexSwiftUI",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "HexSwiftUI",
            targets: ["HexSwiftUI"]
        ),
    ],
    targets: [
        .target(
            name: "HexSwiftUI"
        ),
    ],
    swiftLanguageModes: [.v6]
)
