import Foundation

class FamilyLine{

    private let fromYear:Int
    private let toYear:Int
    
	private let syowa:Emperor
	private let heisei:Emperor

    init(from fromYear:Int, to toYear:Int){
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
	}

    //ArrayListみたいなものシーケンシャルに走査したい時はこっち。
	public func getJYearList() -> Array<Dictionary<String, String>>{

		var list = [Dictionary<String, String>]()

		for year1 in self.fromYear...self.toYear {
    		if syowa.isMyEra(year:year1){
				let item: Dictionary<String, String> = [
					"year":String(year1), "jYear":syowa.getJYearFull(year:year1)
				]
				list.append(item)
    		}
			if heisei.isMyEra(year:year1){
				let item: Dictionary<String, String> = [
					"year":String(year1), "jYear":heisei.getJYearFull(year:year1)
				]
				list.append(item)
    		}
		}

		return list
	}

    //Mapみたいなもの。Keyに対するValueを取得したい時はこっち。
	public func getJYearMap() -> Dictionary<Int, String>{

		var list : Dictionary<Int, String> = [:]

		for year1 in self.fromYear...self.toYear {
    		if syowa.isMyEra(year:year1){
				list[year1] = syowa.getJYearFull(year:year1)
    		}
			if heisei.isMyEra(year:year1){
				list[year1] = heisei.getJYearFull(year:year1)
    		}
		}
		return list
	}
    
}
