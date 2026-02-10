import ProjectDescription

let project = Project(
    name: "NetworkKit",
    targets: [
        .target(
            name: "NetworkKit",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.NetworkKit",
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: []
        )
    ]
)
