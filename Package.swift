import PackageDescription

let package = Package(
    name: "jyear",
    dependencies: [
        .Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion: 1, minor: 1),
        .Package(url: "https://github.com/IBM-Swift/Kitura-StencilTemplateEngine.git", majorVersion: 1, minor: 1),
        .Package(url: "https://github.com/IBM-Swift/HeliumLogger.git", majorVersion: 1, minor: 1),
        .Package(url: "https://github.com/IBM-Swift/LoggerAPI.git", majorVersion: 1, minor: 1)
    ]
)
