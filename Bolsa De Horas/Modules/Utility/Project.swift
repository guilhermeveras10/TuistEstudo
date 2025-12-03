import ProjectDescription

let project = Project(
    name: "Utility",
    targets: [
        .target(
            name: "Utility",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.Utility",
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: ["Sources/Privacy/**"],
            dependencies: []
        )
    ]
)
