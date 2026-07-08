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
        .package(url: "https://github.com/onesdkspm/BTCocoaCategory.git", from: "2.0.3"),
        .package(url: "https://github.com/onesdkspm/UnityBridge.git", from: "2.0.3"),
        .package(url: "https://github.com/onesdkspm/BTSDKUIKitCore.git", from: "2.0.3"),
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
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/UnityNativeUtils/2.0.3-dev-1481358/UnityNativeUtils.xcframework.zip",
            checksum: "b562f3425685a198694e071fd85ee9ebfd2eadb3c502557bdffe6e3b2a767d9c"
        )
    ]
)
