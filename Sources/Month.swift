import Foundation
//
//  Month.swift
//
class Month{

    //年
    private var year:Int = 0
    //月
    private var month:Int = 0
    //開始日
    private var startDate:Int = 0
    //終了日
    private var endDate:Int = 0
    //月に含まれる日と曜日の一覧
    private var dates = [Dictionary<String,String>]()
    
    private var dateComps = DateComponents()
    
    init(year:Int, month:Int, start startDate:Int, end endDate:Int){
        self.year = year
        self.month = month
        self.startDate = startDate
        self.endDate = endDate
        
        let cal = Calendar.current
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = "E"

        self.dateComps.year = self.year
        self.dateComps.month = self.month

        for eachDate in self.startDate...self.endDate {
            
            self.dateComps.day = eachDate
            let theDate = cal.date(from: dateComps)
            //日にちと曜日の組み合わせを配列に格納。
            let date:Dictionary<String,String>
                    = ["date":String(eachDate), "day":dateFormatter.string(from: theDate!)]
            self.dates.append(date)
            
        }
        
    }
    
    public func getDates()->Array<Dictionary<String,String>>{
        return self.dates
    }

}

