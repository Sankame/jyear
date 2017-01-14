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
    
    let thisJYearFull = familyLine.getThisJYearFull()
    let thisJYearName = familyLine.getThisJYearName()    
    let jYearList = familyLine.getJYearListDesc()

    let htmlTitle = "今年は" + thisJYearName + "何年？(季節の画像付き)"
    // the example from https://github.com/kylef/Stencil/blob/master/README.md
    var context:Dictionary<String,Any> = [
        "thisJYearFull" : thisJYearFull
        ,"thisJYearName" : thisJYearName
        ,"jYearList": jYearList
        ,"htmlTitle": htmlTitle
        ,"hostname": request.hostname.lowercased()
    ]

    var viewTemplate = "home.stencil"
    if request.hostname.lowercased().hasPrefix("amp.jyear."){
        viewTemplate = "/amp/home.stencil"
    }

    try response.render(viewTemplate, context: context).end()
}

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8090, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()

