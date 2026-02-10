import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")
let actionAttribute: Template.Attribute = .optional("action")

let template = Template(
    description: "Gera um módulo com arquitetura limpa",
    attributes: [
        nameAttribute,
        actionAttribute
    ],
    items: [
        .file(
            path: "Modules/\(nameAttribute)/Sources/Module/\(nameAttribute)Module.swift",
            templatePath: "Stubs/Module/Module.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Domain/Model/\(nameAttribute).swift",
            templatePath: "Stubs/Domain/Model/Response.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Domain/Model/\(nameAttribute)FlowModel.swift",
            templatePath: "Stubs/Domain/Model/FlowModel.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Domain/Repository/\(nameAttribute)RepositoryProtocol.swift",
            templatePath: "Stubs/Domain/Repository/RepositoryProtocol.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Domain/UseCase/\(nameAttribute)UseCaseProtocol.swift",
            templatePath: "Stubs/Domain/UseCase/UseCaseProtocol.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Domain/UseCase/Get\(nameAttribute)UseCase.swift",
            templatePath: "Stubs/Domain/UseCase/UseCaseImpl.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Support/NavigationSubscriber.swift",
            templatePath: "Stubs/Support/NavigationSubscriber.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Data/Repository/\(nameAttribute)RepositoryImpl.swift",
            templatePath: "Stubs/Data/Repository/RepositoryImpl.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Data/Mapper/\(nameAttribute)Mapper.swift",
            templatePath: "Stubs/Data/Mapper/ResponseMapper.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Data/DTOs/\(nameAttribute)DTO.swift",
            templatePath: "Stubs/Data/DTOs/ResponseDTO.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/Coordinator/\(nameAttribute)Navigate.swift",
            templatePath: "Stubs/Presentation/Coordinator/Navigate.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/Coordinator/\(nameAttribute)Coordinator.swift",
            templatePath: "Stubs/Presentation/Coordinator/Coordinator.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/Feature/Model/ViewState.swift",
            templatePath: "Stubs/Presentation/Feature/Model/ViewState.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/Feature/ViewModel/ViewModel.swift",
            templatePath: "Stubs/Presentation/Feature/ViewModel/ViewModel.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/Feature/View/\(nameAttribute)View.swift",
            templatePath: "Stubs/Presentation/Feature/View/View.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/Feature/View/\(nameAttribute)ViewReadyState.swift",
            templatePath: "Stubs/Presentation/Feature/View/ViewReadyState.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/Feature/View/\(nameAttribute)ViewErrorState.swift",
            templatePath: "Stubs/Presentation/Feature/View/ViewErrorState.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/Feature/View/\(nameAttribute)ViewLoadingState.swift",
            templatePath: "Stubs/Presentation/Feature/View/ViewLoadingState.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/Feature/Factory/\(nameAttribute)Builder.swift",
            templatePath: "Stubs/Presentation/Feature/Factory/Builder.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/DI/\(nameAttribute)Component.swift",
            templatePath: "Stubs/DI/Component.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/DI/\(nameAttribute)CoordinatorComponent.swift",
            templatePath: "Stubs/DI/CoordinatorComponent.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/DI/\(nameAttribute)FactoryComponent.swift",
            templatePath: "Stubs/DI/FactoryComponent.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/DI/\(nameAttribute)RepositoryComponent.swift",
            templatePath: "Stubs/DI/RepositoryComponent.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/DI/\(nameAttribute)UseCaseComponent.swift",
            templatePath: "Stubs/DI/UseCaseComponent.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/DI/\(nameAttribute)ViewComponent.swift",
            templatePath: "Stubs/DI/ViewComponent.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Project.swift",
            templatePath: "Stubs/Project.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Demo/\(nameAttribute)DemoApp.swift",
            templatePath: "Stubs/Demo/DemoApp.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Demo/DemoRootView.swift",
            templatePath: "Stubs/Demo/DemoRootView.stencil"
        ),
    ]
)
