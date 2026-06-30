// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "UnityNativeUtils",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "UnityNativeUtils",
            targets: ["UnityNativeUtilsWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/onesdkspm/BTCocoaCategory.git", branch: "develop"),
        .package(url: "https://github.com/onesdkspm/UnityBridge.git", from: "2.0.0"),
        .package(url: "https://github.com/onesdkspm/BTSDKUIKitCore.git", from: "1.0.0"),
    ],
    targets: [
        // ========== Wrapper Target（统一管理系统依赖）==========
        .target(
            name: "UnityNativeUtilsWrapper",
            dependencies: [
                .byName(name: "UnityNativeUtils"),
                .product(name: "BTCocoaCategory", package: "BTCocoaCategory"),
                .product(name: "UnityBridge", package: "UnityBridge"),
                .product(name: "BTSDKUIKitCore", package: "BTSDKUIKitCore"),
            ],
            path: "UnityNativeUtilsWrapper",
            linkerSettings: [
                // iOS 系统框架
                
                // 系统库
            ]
        ),
        
        // ========== Binary Frameworks ==========
        .binaryTarget(
            name: "UnityNativeUtils",
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/UnityNativeUtils/1.10.7-dev-1474869/UnityNativeUtils.xcframework.zip",
            checksum: "ebec1b3bcb35c6f5c945d593572dc47e62b806b499b0572d570b9d1fb924735f"
        )
    ]
)
