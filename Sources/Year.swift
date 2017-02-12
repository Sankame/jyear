import Foundation
//
//  year.swift
//
class Year{
    
    //年
    private var year:Int = 0
    
    init(year:Int){
        var datesOfYear = [Dictionary<String,String>]()
        
        self.year = year
        
        (1...12).forEach{
            let endDate = self.getEndByMonth(year: self.year, month: $0)
            let month:Month = Month(year: self.year, month: $0, start: 1, end: endDate)
            datesOfYear = datesOfYear + month.getDates()
        }
        
        for eachDate in datesOfYear{
            print(eachDate["date"]! + "/" + eachDate["day"]!)
        }
    }
    
//    public func getDates()->Array<Dictionary<String,String>>{
//        return self.dates
//    }
    
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

