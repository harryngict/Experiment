// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "Experiment",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "Experiment",
            targets: ["Experiment"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Experiment",
            path: "Sources/Experiment"
        ),
        .testTarget(
            name: "ExperimentTests",
            dependencies: ["Experiment"],
            path: "Tests/ExperimentTests"
        ),
    ]
)
