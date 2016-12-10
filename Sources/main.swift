import Kitura
import KituraStencil
import Foundation

let router = Router()

router.add(templateEngine: StencilTemplateEngine())

//Handle HTTP GET requests to Stencil
router.get("/") { request, response, next in
    defer {
        next()
    }

    // the example from https://github.com/kylef/Stencil/blob/master/README.md
    var context2 = [
       "articles": [
         ["title": "Migrating from OCUnit to XCTest", "author": "Kyle Fuller"],
         ["title": "Memory Management with ARC", "author": "Kyle Fuller" ]
       ]
    ]

    try response.render("document.stencil", context: context2).end()
}

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8090, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()

