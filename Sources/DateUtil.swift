//
//  DateUtil.swift
//
import Foundation

class DateUtil{
    
    class func getThisYearString()->String{
        
        let now = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy"
        
        return dateFormatter.string(from: now)
        
    }
    
}

