// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let mainDeps: [PackageDescription.Target.Dependency] = [
    .product(name: "ArgumentParser", package: "swift-argument-parser")
]

let package = Package(
    name: "swift-ls",
    dependencies: [],
    targets: [
        .target(
            name: "swift-ls",
            dependencies: mainDeps),
        .testTarget(
            name: "swift-lsTests",
            dependencies: ["swift-ls"]),
    ]
)

package.dependencies.append(
    .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMinor(from: "0.4.0"))
)
