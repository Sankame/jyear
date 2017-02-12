import Foundation
//
//  year.swift
//
class Year{
    
    //年
    private var year:Int = 0
    
    init(year:Int){
        self.year = year
        
        let month:Month = Month(year: self.year, month: 2, start: 1, end: 28)
        let dates = month.getDates()
        
        for eachDate in dates{
            print(eachDate["date"]! + "/" + eachDate["day"]!)
            //log.verbose(eachDate["date"]! + "/" + eachDate["day"]!)
        }
    }
    
//    public func getDates()->Array<Dictionary<String,String>>{
//        return self.dates
//    }
    
}

