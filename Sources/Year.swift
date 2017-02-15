import Foundation
//
//  year.swift
//
class Year{
    
    //年
    private var year:Int = 0
    
    //private var datesOfYear = [Dictionary<String,String>]()
    
    private var datesByMonth:Dictionary<String, Array<Dictionary<String,String>>> = [:]
    
    init(year:Int){
        
        
        self.year = year
        
        (1...12).forEach{
            let endDate = self.getEndByMonth(year: self.year, month: $0)
            let month:Month = Month(year: self.year, month: $0, start: 1, end: endDate)
//            datesOfYear = datesOfYear + month.getDates()
            
            self.datesByMonth[String($0)] = self.makeCalData(datesOfMonth: month.getDates())
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
    
    private func makeCalData(datesOfMonth:Array<Dictionary<String,String>>)->Array<Dictionary<String,String>>{
        
        var calData = [Dictionary<String,String>]()
        
        let days = ["日", "月", "火", "水", "木", "金", "土"]
        var calIndex = 0
        var monthIndex = 0

        week: for _ in 1...10{
        
            for day in days{

                var item:Dictionary<String, String> = [:]
                item["index"] = String(calIndex)

                // カレンダーとその月の曜日が一致する間だけ日にちをセット。
                if monthIndex < datesOfMonth.count
                    && day == datesOfMonth[monthIndex]["day"]{

                    item["date"] = datesOfMonth[monthIndex]["date"]
                    item["day"] = datesOfMonth[monthIndex]["day"]
                    
                    monthIndex = monthIndex+1

                }else{
                    item["date"] = ""
                    item["day"] = ""
                }
                
                calData.append(item)
                calIndex = calIndex + 1
                
                if day == days[days.count-1] && item["date"] == ""{
                    break week
                }
            }

        }
        return calData
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

