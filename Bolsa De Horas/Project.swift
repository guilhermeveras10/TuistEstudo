import ProjectDescription

let project = Project(
    name: "Bolsa De Horas",
    packages: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.9.1"),
    ],
    targets: [
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
                "Bolsa De Horas/Resources",
                "Modules",
            ],
            dependencies: [
                .package(product: "Alamofire"),
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
