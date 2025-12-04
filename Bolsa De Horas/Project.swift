import ProjectDescription

let project = Project(
    name: "Bolsa De Horas",
    packages: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.9.1"),
        .package(url: "https://github.com/uber/needle.git", from: "0.24.0"),
    ],
    targets: [
        .target(
            name: "Utility",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.Utility",
            infoPlist: .default,
            sources: ["Modules/Utility/Sources/**"],
            resources: ["Modules/Utility/Sources/Privacy/**"],
            dependencies: []
        ),
        .target(
            name: "Anime",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.Anime",
            infoPlist: .default,
            sources: ["Modules/Anime/Sources/**"],
            dependencies: [
                .package(product: "Alamofire"),
                .package(product: "NeedleFoundation"),
                .target(name: "Utility")
            ]
        ),
        .target(
            name: "AnimeDemo",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.AnimeDemo",
            infoPlist: .default,
            sources: ["Modules/Anime/Demo/**"],
            dependencies: [
                .target(name: "Anime")
            ]
        ),
        .target(
            name: "Bolsa De Horas",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.Bolsa-De-Horas",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            buildableFolders: [
                "Bolsa De Horas/Sources",
                "Bolsa De Horas/Resources"
            ],
            dependencies: [
                .package(product: "Alamofire"),
                .package(product: "NeedleFoundation"),
                .target(name: "Utility"),
                .target(name: "Anime")
            ]
        ),
        .target(
            name: "Bolsa De HorasTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.Bolsa-De-HorasTests",
            infoPlist: .default,
            buildableFolders: [
                "Bolsa De Horas/Tests"
            ],
            dependencies: [.target(name: "Bolsa De Horas")]
        ),
    ]
)
