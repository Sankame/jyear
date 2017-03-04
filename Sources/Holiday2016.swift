//
//  Holiday.swift
//  jyear
//
//  Created by mx on 2017/02/21.
//
//
class Holiday2016:HolidayProtocol{
    
    private var year = 0
    
    public func isHoliday(year:Int, month:Int, date:Int)->Bool{
    
        self.year = year
        
        switch (year, month, date) {
            case (self.year, 1, 1):
                return true
            case (self.year, 1, 11):
                return true
            case (self.year, 2, 11):
                return true
            case (self.year, 3, 20...21):
                return true
            case (self.year, 4, 29):
                return true
            case (self.year, 5, 3...5):
                return true
            case (self.year, 7, 18):
                return true
            case (self.year, 8, 11):
                return true
            case (self.year, 9, 19):
                return true
            case (self.year, 9, 22):
                return true
            case (self.year, 10, 10):
                return true
            case (self.year, 11, 3):
                return true
            case (self.year, 11, 23):
                return true
            case (self.year, 12, 23):
                return true
            default:
                return false
        }
    }
}
