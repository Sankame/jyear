//
//  Holiday.swift
//  jyear
//
//  Created by mx on 2017/02/21.
//
//
class Holiday2020:HolidayProtocol{
    
    public func isHoliday(year:Int, month:Int, date:Int)->Bool{
        
        switch (year, month, date) {
        case (2020, 1, 1):
            return true
        case (2020, 1, 13):
            return true
        case (2020, 2, 11):
            return true
        case (2020, 3, 20):
            return true
        case (2020, 4, 29):
            return true
        case (2020, 5, 3...6):
            return true
        case (2020, 7, 20):
            return true
        case (2020, 8, 11):
            return true
        case (2020, 9, 21...22):
            return true
        case (2020, 10, 12):
            return true
        case (2020, 11, 3):
            return true
        case (2020, 11, 23):
            return true
        case (2020, 12, 23):
            return true
        default:
            return false
        }
    }
}
