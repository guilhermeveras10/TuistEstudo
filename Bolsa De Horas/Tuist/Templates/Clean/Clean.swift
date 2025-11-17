import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")

let template = Template(
    description: "Gera um módulo com arquitetura limpa",
    attributes: [
        nameAttribute
    ],
    items: [
        .file(
            path: "Modules/\(nameAttribute)/Sources/Presentation/\(nameAttribute)View.swift",
            templatePath: "Stubs/View.stencil"
        ),
    ]
)
