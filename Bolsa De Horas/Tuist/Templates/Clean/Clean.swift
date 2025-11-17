import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")

let template = Template(
    description: "Gera um módulo com arquitetura limpa",
    attributes: [
        nameAttribute
    ],
    items: [
        .file(
<<<<<<< HEAD
            path: "Modules/\(nameAttribute)/Sources/Presentation/\(nameAttribute)View.swift",
            templatePath: "Stubs/View.stencil"
        ),
=======
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
            path: "Modules/\(nameAttribute)/Sources/Presentation/ViewState.swift",
            templatePath: "Stubs/Presentation/ViewState.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/ViewModel.swift",
            templatePath: "Stubs/Presentation/ViewModel.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/UI/GenericView.swift",
            templatePath: "Stubs/View.stencil"
        ),
        .file(
            path: "Modules/\(nameAttribute)/Sources/\(nameAttribute)Builder.swift",
            templatePath: "Stubs/Builder.stencil"
        ),
>>>>>>> 24a51c5 (first commit)
    ]
)
