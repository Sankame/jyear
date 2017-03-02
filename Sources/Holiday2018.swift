//
//  Holiday.swift
//  jyear
//
//  Created by mx on 2017/02/21.
//
//
class Holiday2018:HolidayProtocol{
    
    public func isHoliday(year:Int, month:Int, date:Int)->Bool{
        
        switch (year, month, date) {
        case (2018, 1, 1):
            return true
        case (2018, 1, 8):
            return true
        case (2018, 2, 11):
            return true
        case (2018, 2, 12):
            return true
        case (2018, 3, 21):
            return true
        case (2018, 4, 29...30):
            return true
        case (2018, 5, 3...5):
            return true
        case (2018, 7, 16):
            return true
        case (2018, 8, 11):
            return true
        case (2018, 9, 17):
            return true
        case (2018, 9, 23...24):
            return true
        case (2018, 10, 8):
            return true
        case (2018, 11, 3):
            return true
        case (2018, 11, 23):
            return true
        case (2018, 12, 23...24):
            return true
        default:
            return false
        }
    }
}
