import Kitura
import KituraStencil
import Foundation

let router = Router()

router.add(templateEngine: StencilTemplateEngine())

router.all("/", middleware: StaticFileServer(path: "./Views/Public"))

//Handle HTTP GET requests to Stencil
router.get("/") { request, response, next in
    defer {
        next()
    }

    let thisYear:Int = Int(DateUtil.getThisYearString())!

    let familyLine = FamilyLine(from:DateUtil.HEAD_OF_20TH_CENTURY,to:thisYear)

    let jYearMap = familyLine.getJYearMap()
    
    let jYearList = familyLine.getJYearListDesc()

    // the example from https://github.com/kylef/Stencil/blob/master/README.md
    var context:Dictionary<String,Any> = [
        "thisJYear" : jYearMap[thisYear] as String!
        ,"jYearList": jYearList
    ]

    try response.render("document.stencil", context: context).end()
}

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8090, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()

