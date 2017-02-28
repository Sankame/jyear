import Kitura
import KituraStencil
import Foundation

import LoggerAPI
import HeliumLogger

extension String {
    var isNumeric: Bool {
        return !isEmpty && range(of: "[^0-9]", options: .regularExpression) == nil
    }
}

let router = Router()

router.add(templateEngine: StencilTemplateEngine())
router.all("/", middleware: StaticFileServer(path: "./Views/Public"))

//******************************************
// 和暦表示
//******************************************
router.get("/") { request, response, next in
    //これでドメインは取れる。ローカルならjyear.localになる。
//    Log.logger = HeliumLogger()
    let qsYear = request.queryParameters["year"] ?? ""

//    Log.verbose(pYear)

    defer {
        next()
    }

    //現在の西暦
    let thisYear = Int(DateUtil.getThisYearString())!
    
    //表示対象の西暦
    var displayYear:Int = 0
    
    if(qsYear.isNumeric){
        displayYear = Int(qsYear)!
    }else{
        displayYear = Int(DateUtil.getThisYearString())!
    }
    
    let familyLine = FamilyLine(display:displayYear, from:DateUtil.HEAD_OF_20TH_CENTURY,to:thisYear)
    
    let list = familyLine.getDisplayJYearFull()
    var displayJYearFull = ""
    var displayJYearOptions = [String]()
    
    for (index, element) in list.enumerated() {
        if index == 0 {
            displayJYearFull = element
        }else{
            //2行目以降に表示したい和暦を配列に再格納。
            displayJYearOptions.append(element)
        }
    }

    let displayJYearName = familyLine.getDisplayJYearName()
    let displayYearFull  = familyLine.getDisplayYearFull()
    let jYearList = familyLine.getJYearListDesc()

    let htmlTitle = displayYearFull + "は" + displayJYearName + "何年？(季節の画像付き)"
    // the example from https://github.com/kylef/Stencil/blob/master/README.md
    var context:Dictionary<String,Any> = [
        "displayYearFull" : displayYearFull
        ,"thisJYearFull" : displayJYearFull
        ,"thisJYearName" : displayJYearName
        ,"jYearList": jYearList
        ,"htmlTitle": htmlTitle
        ,"hostname": request.hostname.lowercased()
        ,"displayJYearOptions":displayJYearOptions
        ,"animalName": OrientalZodiac.getAnimalName(year:displayYear)
    ]

    var viewTemplate = "home.stencil"
    if request.hostname.lowercased().hasPrefix("amp.jyear."){
        viewTemplate = "/amp/home.stencil"
    }

    try response.render(viewTemplate, context: context).end()
}

//******************************************
// シンプルカレンダー
//******************************************
router.get("/cal") { request, response, next in

    let qsYear = request.queryParameters["year"] ?? ""
    
    defer {
        next()
    }

    //表示対象の西暦
    var targetYear:Int = 0
    
    if(qsYear.isNumeric){
        targetYear = Int(qsYear)!
    }else{
        targetYear = Int(DateUtil.getThisYearString())!
    }

    //TODO,最初は固定。
//    let targetYear = 2017
    let year = Year(year:targetYear)
    
    //viewでboolしか判定できないためthisMonthFoundにはfalseを設定。
    let thisMonthFound = year.getThisMonthFound()
    
    var context:Dictionary<String,Any> = [
        "appName" : "シンプルカレンダー"
        ,"baseUrl" : "/cal"
        ,"assetsPath" : "/cal"
        ,"targetYear" : targetYear
        ,"datesByMonth" : year.getDates()
        ,"thisMonthFound" : thisMonthFound==0 ? false : thisMonthFound
    ]

    //var viewTemplate = "cal.stencil"
    var viewTemplate = "simple-cal.stencil"
    
    try response.render(viewTemplate, context: context).end()
}

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8090, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()
