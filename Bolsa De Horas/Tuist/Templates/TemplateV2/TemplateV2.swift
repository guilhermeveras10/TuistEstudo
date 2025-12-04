import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")
let actionAttribute: Template.Attribute = .optional("action", default: .string(""))

let featureFolder = "01 - \(nameAttribute)s"

let template = Template(
    description: "Template V2 baseado no módulo Anime (Needle + Tuist + mise)",
    attributes: [
        nameAttribute,
        actionAttribute
    ],
    items: [
        .file(
            path: "Modules/\(nameAttribute)/Project.swift",
            templatePath: "Stubs/Project.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Module/\(nameAttribute)Module.swift",
            templatePath: "Stubs/Module/Module.stencil"
        ),
        // Domain
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
            path: "Modules/\(nameAttribute)/Sources/Domain/UseCase/API\(nameAttribute)UseCase.swift",
            templatePath: "Stubs/Domain/UseCase/UseCaseImpl.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Domain/UseCase/API\(nameAttribute)UseCaseComponent.swift",
            templatePath: "Stubs/Domain/UseCase/UseCaseComponent.stencil"
        ),
        // Data
        .file(
            path: "Modules/\(nameAttribute)/Sources/Data/DTOs/\(nameAttribute)DTO.swift",
            templatePath: "Stubs/Data/DTOs/ResponseDTO.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Data/DTOs/\(nameAttribute)ListDTO.swift",
            templatePath: "Stubs/Data/DTOs/ListDTO.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Data/Mapper/\(nameAttribute)Mapper.swift",
            templatePath: "Stubs/Data/Mapper/ResponseMapper.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Data/Mapper/\(nameAttribute)PageMapper.swift",
            templatePath: "Stubs/Data/Mapper/PageMapper.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Data/Repository/API\(nameAttribute)RepositoryImpl.swift",
            templatePath: "Stubs/Data/Repository/APIRepositoryImpl.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Data/Repository/API\(nameAttribute)RepositoryComponent.swift",
            templatePath: "Stubs/Data/Repository/APIRepositoryComponent.stencil"
        ),
        // DI
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
        // Presentation - Coordinator
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/Coordinator/\(nameAttribute)Navigate.swift",
            templatePath: "Stubs/Presentation/Coordinator/Navigate.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/Coordinator/\(nameAttribute)Coordinator.swift",
            templatePath: "Stubs/Presentation/Coordinator/Coordinator.stencil"
        ),
        // Presentation - Feature
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/Feature/\(featureFolder)/\(nameAttribute)sViewComponent.swift",
            templatePath: "Stubs/Presentation/Feature/FeatureViewComponent.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/Feature/\(featureFolder)/Factory/\(nameAttribute)ViewStateFactoryComponent.swift",
            templatePath: "Stubs/Presentation/Feature/Factory/ViewStateFactoryComponent.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/Feature/\(featureFolder)/Factory/\(nameAttribute)sViewStateFactory.swift",
            templatePath: "Stubs/Presentation/Feature/Factory/ViewStateFactory.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/Feature/\(featureFolder)/Model/\(nameAttribute)sViewState.swift",
            templatePath: "Stubs/Presentation/Feature/Model/ViewState.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/Feature/\(featureFolder)/View/\(nameAttribute)sView.swift",
            templatePath: "Stubs/Presentation/Feature/View/View.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/Feature/\(featureFolder)/View/\(nameAttribute)sViewReadyState.swift",
            templatePath: "Stubs/Presentation/Feature/View/ViewReadyState.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/Feature/\(featureFolder)/View/\(nameAttribute)sViewErrorState.swift",
            templatePath: "Stubs/Presentation/Feature/View/ViewErrorState.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/Feature/\(featureFolder)/View/\(nameAttribute)sViewLoadingState.swift",
            templatePath: "Stubs/Presentation/Feature/View/ViewLoadingState.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/Feature/\(featureFolder)/ViewModel/\(nameAttribute)sViewModel.swift",
            templatePath: "Stubs/Presentation/Feature/ViewModel/ViewModel.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/Feature/\(featureFolder)/ViewModel/\(nameAttribute)sViewModelImpl.swift",
            templatePath: "Stubs/Presentation/Feature/ViewModel/ViewModelImpl.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/Feature/\(featureFolder)/ViewModel/\(nameAttribute)sViewModelState.swift",
            templatePath: "Stubs/Presentation/Feature/ViewModel/ViewModelState.stencil"
        ),
        // Demo
        .file(
            path: "Modules/\(nameAttribute)/Demo/AppDelegate.swift",
            templatePath: "Stubs/Demo/AppDelegate.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Demo/ContentView.swift",
            templatePath: "Stubs/Demo/ContentView.stencil"
        )
    ]
)
