// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "ArcRaidersData",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "ArcRaidersData",
            targets: ["ArcRaidersData"]),
    ],
    targets: [
        .target(
            name: "ArcRaidersData",
            dependencies: [],
            resources: [
                .process("Data"),
                .copy("Data/items.json")
            ]
        )
    ]
)
