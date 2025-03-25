//
//  Package.swift
//  
//
//  Created by Hasnat Tariq on 25/09/1446 AH.
//
import PackageDescription

let package = Package(
    name: "MapMetrics",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "MapMetrics",
            targets: ["MapMetrics"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "MapMetrics",
            url: "https://github.com/yourname/MapMetricsSPM/releases/download/1.0.0/MapMetrics.xcframework.zip",
            checksum: "sha256-checksum-here" // Run `swift package compute-checksum MapMetrics.xcframework.zip`
        )
    ],
)
