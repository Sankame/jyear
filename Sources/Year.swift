import Foundation
//
//  year.swift
//
class Year{
    
    //年
    private var year:Int = 0
    
    private var datesByMonth:Dictionary<String, Array<Dictionary<String,Any>>> = [:]
    
    init(year:Int){
        
        
        self.year = year
        
        (1...12).forEach{
            let endDate = self.getEndByMonth(year: self.year, month: $0)
            let month:Month = Month(year: self.year, month: $0, start: 1, end: endDate)
            
            self.datesByMonth[String($0)] = self.makeCalData(datesOfMonth: month.getDates())
        }

    }
    
    public func getDates()->Dictionary<String, Array<Dictionary<String,Any>>>{
        return self.datesByMonth
    }

    private func makeCalData(datesOfMonth:Array<Dictionary<String,String>>)->Array<Dictionary<String,Any>>{
        
        var calData = [Dictionary<String,Any>]()
        
        let days = ["日", "月", "火", "水", "木", "金", "土"]
        var calIndex = 0
        var monthIndex = 0

        week: for _ in 1...10{
        
            for day in days{

                var item:Dictionary<String, Any> = [:]

                if day == days[0] {
                    item["first"] = "1"
                }
                if day == days[days.count-1] {
                    item["last"] = "1"
                }

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
                
                if day == days[days.count-1] && item["date"] as! String == ""{
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

