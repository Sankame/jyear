//
//  DateUtil.swift
//
import Foundation

class DateUtil{
    
    static let HEAD_OF_20TH_CENTURY = 1900
    
    class func getThisYearString()->String{
        
        let now = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy"
        
//        return "2017"
        return dateFormatter.string(from: now)
        
    }
    
}

