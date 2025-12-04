import ProjectDescription

let project = Project(
    name: "Cadastro",
    packages: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.9.1"),
        .package(url: "https://github.com/uber/needle.git", from: "0.24.0")
    ],
    targets: [
        .target(
            name: "Cadastro",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.Cadastro",
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: [
                .package(product: "Alamofire"),
                .package(product: "NeedleFoundation"),
                .project(target: "Utility", path: "../Utility")
            ]
        ),
        .target(
            name: "CadastroDemo",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.CadastroDemo",
            infoPlist: .default,
            sources: ["Demo/**"],
            dependencies: [
                .target(name: "Cadastro")
            ]
        ),
    ]
)
