// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "XcodeGen",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(
            name: "xcodegen",
            targets: [
                "XcodeGen"
            ]
        ),
        .library(
            name: "XcodeGenKit",
            targets: [
                "XcodeGenKit"
            ]
        ),
        .library(
            name: "ProjectSpec",
            targets: [
                "ProjectSpec"
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/kylef/PathKit.git", from: "1.0.1"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "5.0.0"),
        .package(url: "https://github.com/yonaskolb/JSONUtilities.git", from: "4.2.0"),
        .package(url: "https://github.com/kylef/Spectre.git", from: "0.9.2"),
        .package(url: "https://github.com/PreternaturalAI/XcodeProj.git", branch: "main"),
        .package(url: "https://github.com/jakeheis/SwiftCLI.git", from: "6.0.3"),
    ],
    targets: [
        .executableTarget(name: "XcodeGen", dependencies: [
            "XcodeGenCLI",
        ]),
        .target(name: "XcodeGenCLI", dependencies: [
            "XcodeGenKit",
            "ProjectSpec",
            "SwiftCLI",
            "PathKit",
        ]),
        .target(name: "XcodeGenKit", dependencies: [
            "ProjectSpec",
            "JSONUtilities",
            "XcodeProj",
            "PathKit",
            "XcodeGenCore",
        ], resources: [
            .copy("SettingPresets")
        ]),
        .target(name: "ProjectSpec", dependencies: [
            "JSONUtilities",
            "XcodeProj",
            "Yams",
            "XcodeGenCore",
        ]),
        .target(name: "XcodeGenCore", dependencies: [
            "PathKit",
            "Yams",
        ]),
        .target(name: "TestSupport", dependencies: [
            "XcodeProj",
            "Spectre",
            "PathKit",
        ]),
        .testTarget(name: "XcodeGenKitTests", dependencies: [
            "XcodeGenKit",
            "Spectre",
            "PathKit",
            "TestSupport",
        ]),
        .testTarget(name: "FixtureTests", dependencies: [
            "XcodeGenKit",
            "Spectre",
            "PathKit",
            "TestSupport",
        ]),
        .testTarget(name: "XcodeGenCoreTests", dependencies: [
            "XcodeGenCore",
            "Spectre",
            "PathKit",
            "TestSupport",
        ]),
        .testTarget(name: "ProjectSpecTests", dependencies: [
            "ProjectSpec",
            "Spectre",
            "PathKit",
            "TestSupport",
        ]),
        .testTarget(name: "PerformanceTests", dependencies: [
            "XcodeGenKit",
            "Spectre",
            "PathKit",
            "TestSupport",
        ]),
    ]
)
