// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "ArcRaidersData",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "ArcRaidersData",
            targets: ["ArcRaidersData"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ArcRaidersData",
            dependencies: [],
            resources: [
                .copy("Data")
            ]
        )
    ]
)
