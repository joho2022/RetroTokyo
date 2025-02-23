import ProjectDescription

let project = Project(
    name: "RetroTokyo",
    targets: [
        .target(
            name: "RetroTokyo",
            destinations: [.iPhone, .iPad],
            product: .app,
            bundleId: "io.hogeunjo.RetroTokyo",
            deploymentTargets: .iOS("17.5"),
            infoPlist: .extendingDefault(
                with: [
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
