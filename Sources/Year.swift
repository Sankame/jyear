import Foundation
//
//  year.swift
//
class Year{
    
    //年
    private var year:Int = 0
    
    private var datesOfYear = [Dictionary<String,String>]()
    
    private var datesByMonth:Dictionary<String, Array<Dictionary<String,String>>> = [:]
    
    init(year:Int){
        
        
        self.year = year
        
        (1...12).forEach{
            let endDate = self.getEndByMonth(year: self.year, month: $0)
            let month:Month = Month(year: self.year, month: $0, start: 1, end: endDate)
            datesOfYear = datesOfYear + month.getDates()
            
            self.datesByMonth[String($0)] = month.getDates()
        }

// TODO,debug
//        for eachDate in datesOfYear{
//            print(eachDate["month"]! + "/" + eachDate["date"]! + "/" + eachDate["day"]!)
//        }
    }
    
    public func getDates()->Dictionary<String, Array<Dictionary<String,String>>>{
//        var datesForReturn:Dictionary<String, Array<Dictionary<String,String>>> = [:]
//        datesForReturn["test"] = self.datesOfYear
//        return datesForReturn
        return self.datesByMonth
    }
    
    private func getEndByMonth(year:Int, month:Int)->Int{
        switch month {
        case 2:
            if self.isLeapYear(year: year){
                return 29
            }else{
                return 28
            }
        case 4, 6, 9, 11:
            return 30
        default:
            return 31
        }
    }
    
    private func isLeapYear(year: Int) -> Bool {
        // 4以上ではない場合は弾く
        guard year >= 4 else {
            return false
        }
        
        // 閏年の条件
        // - 4で割り切れる年は閏年
        // - 100で割り切れる年は閏年ではない
        // - 400で割り切れる年は閏年
        return year % 400 == 0 || (year % 100 != 0 && year % 4 == 0)
    }
}

