//
//  Emperor.swift
//
class Emperor{

    //開始年(西暦)
    private var tenureStart:Int = 0
    //終了年(西暦)
    private var tenureEnd:Int = 0
    //年号名称
    private var jYearName:String = ""
    //和暦
    private var jYear:Int = 0

    public func setTenureStart(year:Int){
        self.tenureStart = year
    }

    public func setTenureEnd(year:Int){
        self.tenureEnd = year
    }

    public func setJYearName(jYearName:String){
        self.jYearName = jYearName
    }

    public func getJYearName()->String{
        return self.jYearName
    }

    public func getJYear(year:Int)->Int{
        let diff = year - self.tenureStart + 1
        return diff
    }

    public func getJYearFull(year:Int)->String{
        return self.jYearName
                + String(getJYear(year:year))
    }

    public func isMyEra(year:Int)->Bool{
        if self.tenureStart...self.tenureEnd~=year {
            return true
        }
        return false
    }
}

