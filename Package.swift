// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LSFFmpegKit",
    platforms: [.iOS(.v13), .macCatalyst(.v14), .macOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LSFFmpegKit",
            targets: ["LSFFmpegKit"]
        ),
        .library(name: "Libavcodec", targets: ["Libavcodec"]),
        .library(name: "Libavfilter", targets: ["Libavfilter"]),
        .library(name: "Libavformat", targets: ["Libavformat"]),
        .library(name: "Libavutil", targets: ["Libavutil"]),
        .library(name: "Libswresample", targets: ["Libswresample"]),
        .library(name: "Libswscale", targets: ["Libswscale"]),
        .library(name: "Libavdevice", targets: ["Libavdevice"]),
        .library(name: "FFmpegKit", targets: ["FFmpegKit"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LSFFmpegKit",
            dependencies: [
                "Libavcodec", "Libavfilter", "Libavformat", "Libavutil", "Libswresample", "Libswscale",
                "Libavdevice", "FFmpegKit",
            ],
            linkerSettings: [
                .linkedFramework("AudioToolbox"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("Metal"),
                .linkedFramework("VideoToolbox"),
                .linkedLibrary("bz2"),
                .linkedLibrary("iconv"),
                .linkedLibrary("xml2"),
                .linkedLibrary("z"),
                .linkedLibrary("c++"),
            ]
        ),
        .binaryTarget(
            name: "Libavcodec",
            path: "Sources/libavcodec.xcframework"
        ),
        .binaryTarget(
            name: "Libavfilter",
            path: "Sources/libavfilter.xcframework"
        ),
        .binaryTarget(
            name: "Libavformat",
            path: "Sources/libavformat.xcframework"
        ),
        .binaryTarget(
            name: "Libavutil",
            path: "Sources/libavutil.xcframework"
        ),
        .binaryTarget(
            name: "Libswresample",
            path: "Sources/libswresample.xcframework"
        ),
        .binaryTarget(
            name: "Libswscale",
            path: "Sources/libswscale.xcframework"
        ),
        .binaryTarget(
            name: "Libavdevice",
            path: "Sources/libavdevice.xcframework"
        ),
        .binaryTarget(
            name: "FFmpegKit",
            path: "Sources/ffmpegKit.xcframework"
        ),
        .testTarget(
            name: "FFmpegKitTests",
            dependencies: ["LSFFmpegKit"]),
    ]
)
