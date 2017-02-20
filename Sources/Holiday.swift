//
//  Holiday.swift
//  jyear
//
//  Created by mx on 2017/02/21.
//
//

import Foundation

class Holiday{
    
    init(){}

    class public func isHoliday(year:Int, month:Int, date:Int)->Bool{

        switch (year, month, date) {
            case (2017, 1, 1):
                return true
            case (2017, 1, 2):
                return true
            case (2017, 1, 9):
                return true
            case (2017, 2, 11):
                return true
            case (2017, 3, 20):
                return true
            case (2017, 4, 29):
                return true
            case (2017, 5, 3...5):
                return true
            case (2017, 7, 17):
                return true
            case (2017, 8, 11):
                return true
            case (2017, 9, 18):
                return true
            case (2017, 9, 23):
                return true
            case (2017, 9, 18):
                return true
            case (2017, 10, 9):
                return true
            case (2017, 11, 3):
                return true
            case (2017, 11, 23):
                return true
            case (2017, 12, 23):
                return true
            default:
                return false
        }
    }
}
