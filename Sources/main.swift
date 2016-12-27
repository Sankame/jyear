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

    let thisYear:Int = Int(DateUtil.getThisYearString())!
    
	let familyLine = FamilyLine()
    let jYearMap = familyLine.getJYearMap()
    
    // the example from https://github.com/kylef/Stencil/blob/master/README.md
    var context:Dictionary<String,Any> = [
       "jYearList": familyLine.getJYearList()
        ,"thisJYear" : jYearMap[thisYear] as String!
    ]

    try response.render("document.stencil", context: context).end()
}

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 80, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()

