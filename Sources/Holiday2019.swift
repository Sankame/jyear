//
//  Holiday.swift
//  jyear
//
//  Created by mx on 2017/02/21.
//
//
class Holiday2019:HolidayProtocol{
    
    public func isHoliday(year:Int, month:Int, date:Int)->Bool{
        
        switch (year, month, date) {
        case (2019, 1, 1):
            return true
        case (2019, 1, 14):
            return true
        case (2019, 2, 11):
            return true
        case (2019, 3, 21):
            return true
        case (2019, 4, 29):
            return true
        case (2019, 5, 3...4):
            return true
        case (2019, 5, 5...6):
            return true
        case (2019, 7, 15):
            return true
        case (2019, 8, 11...12):
            return true
        case (2019, 9, 16):
            return true
        case (2019, 9, 23):
            return true
        case (2019, 10, 14):
            return true
        case (2019, 11, 3...4):
            return true
        case (2019, 11, 23):
            return true
        case (2019, 12, 23):
            return true
        default:
            return false
        }
    }
}
