//
//  OrientalZodiac.swift
//
class OrientalZodiac{
    
    class func getAnimalName(year:Int)->String{
        let x:Int = year % 12
        
        switch x {
        case 0:
            return "申"
        case 1:
            return "酉"
        case 2:
            return "戌"
        case 3:
            return "亥"
        case 4:
            return "子"
        case 5:
            return "丑"
        case 6:
            return "寅"
        case 7:
            return "卯"
        case 8:
            return "辰"
        case 9:
            return "巳"
        case 10:
            return "午"
        case 11:
            return "未"
        default:
            return ""
        }
    }

}

