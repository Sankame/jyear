//
//  Holiday.swift
//  jyear
//
//  Created by mx on 2017/02/21.
//
//
import Foundation

class Holiday{
    
    class public func isHoliday(year:Int, month:Int, date:Int)->Bool{

        let holiday:HolidayProtocol
        
        switch year {
            case 2020:
                holiday = Holiday2020()
            case 2019:
                holiday = Holiday2019()
            case 2018:
                holiday = Holiday2018()
            case 2017:
                holiday = Holiday2017()
            case 2016:
                holiday = Holiday2016()
            default:
                holiday = Holiday2017()
        }
        
        return holiday.isHoliday(year: year, month: month, date: date)
        
    }
}
