import ProjectDescription

let project = Project(
    name: "RetroTokyo",
    targets: [
        .target(
            name: "RetroTokyo",
            destinations: [.iPhone, .iPad],
            product: .app,
            bundleId: "io.hogeunjo.RetroTokyo",
            deploymentTargets: .iOS("16.5"),
            infoPlist: .extendingDefault(
                with: [
                    "NSCameraUsageDescription": "카메라 접근 권한이 필요합니다.",
                    "NSPhotoLibraryUsageDescription": "사진을 선택하거나 저장하기 위해 사진 라이브러리에 접근 권한이 필요합니다.",
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ]
                ]
            ),
            sources: ["RetroTokyo/Sources/**"],
            resources: ["RetroTokyo/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "RetroTokyoTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.RetroTokyoTests",
            infoPlist: .default,
            sources: ["RetroTokyo/Tests/**"],
            resources: [],
            dependencies: [.target(name: "RetroTokyo")]
        ),
    ]
)
