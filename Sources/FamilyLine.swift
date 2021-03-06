import Foundation

class FamilyLine{

    private let displayYear:Int
    private let fromYear:Int
    private let toYear:Int
    
	private let syowa:Emperor
	private let heisei:Emperor

    private var jYearFullMap : Dictionary<Int, String> = [:]
    
    init(display displayYear:Int, from fromYear:Int, to toYear:Int){
        self.displayYear = displayYear
        self.fromYear = fromYear
        self.toYear = toYear
        
		self.syowa = Emperor()
		syowa.setJYearName(jYearName:"昭和")
		syowa.setTenureStart(year:1926)
		syowa.setTenureEnd(year:1989)

		self.heisei = Emperor()
		heisei.setJYearName(jYearName:"平成")
		heisei.setTenureStart(year:1989)
		heisei.setTenureEnd(year:self.toYear)
        
        self.makeJYearMap()
	}
    
    //Mapみたいなもの。Keyに対するValueを取得したい時はこっち。
    //下記のMapを作成。
    //Key=西暦、Value=和暦年数
    //Key=西暦、Value=和暦年号のみ
    private func makeJYearMap(){
        
        for currentYear in self.fromYear...self.toYear {
            if heisei.isMyEra(year:currentYear){
                self.jYearFullMap[currentYear] = heisei.getJYearFull(year:currentYear)
            }
            if syowa.isMyEra(year:currentYear){
                self.jYearFullMap[currentYear] = syowa.getJYearFull(year:currentYear)
            }
        }

    }

    //降順に和暦・西暦リストを取得。
    public func getJYearListDesc() -> Array<Dictionary<String, String>>{

        var list = [Dictionary<String, String>]()
        
        for year1 in (fromYear...toYear).reversed(){

            if heisei.isMyEra(year:year1){
                let item: Dictionary<String, String> = [
                    "year":String(year1), "jYear":heisei.getJYearFull(year:year1)
                ]
                list.append(item)
            }
            if syowa.isMyEra(year:year1){
                let item: Dictionary<String, String> = [
                    "year":String(year1), "jYear":syowa.getJYearFull(year:year1)
                ]
                list.append(item)
            }

        }
        return list
    }
    
    public func getDisplayJYearFull() -> Array<String>{

        var listOfJYear = [String]()
        //表示する西暦が該当する年号を複数返す。
        //新しい年号が優先。
        if heisei.isMyEra(year:self.displayYear){
            listOfJYear.append(heisei.getJYearFull(year:self.displayYear))
        }
        if syowa.isMyEra(year:self.displayYear){
            listOfJYear.append(syowa.getJYearFull(year:self.displayYear))
        }
        return listOfJYear
    }
    
    public func getDisplayJYearName() -> String{

        //表示する西暦が該当する年号を一つだけ返す。
        //新しい年号が優先。
        if heisei.isMyEra(year:self.displayYear){
            return heisei.getJYearName()
        }
        if syowa.isMyEra(year:self.displayYear){
            return syowa.getJYearName()
        }

        return ""
    }

    public func getDisplayYearFull() -> String{
        if self.toYear == self.displayYear {
            return "今年"
        }
        return String(self.displayYear) + "年"
    }

}
