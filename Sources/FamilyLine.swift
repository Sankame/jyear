import Foundation

class FamilyLine{

	private let syowa:Emperor
	private let heisei:Emperor

	init(){
		self.syowa = Emperor()
		syowa.setJYearName(jYearName:"昭和")
		syowa.setTenureStart(year:1926)
		syowa.setTenureEnd(year:1989)

		self.heisei = Emperor()
		heisei.setJYearName(jYearName:"平成")
		heisei.setTenureStart(year:1989)
		heisei.setTenureEnd(year:getThisYearString())
	}

	private func getThisYearString() -> Int{
		let dateFormatter = DateFormatter()
		dateFormatter.locale = Locale(identifier: "ja_JP")
		dateFormatter.dateFormat = "yyyy"
		return Int(dateFormatter.string(from:Date()))!
	}

	public func showJYearList(){

		for year1 in 1900...2016 {
    		if syowa.isMyEra(year:year1){
        		print(syowa.getJYearFull(year:year1))
    		}
  
			if heisei.isMyEra(year:year1){
        		print(heisei.getJYearFull(year:year1))
    		}
		}
	}

	public func getJYearList() -> Array<Dictionary<String, String>>{

		var list = [Dictionary<String, String>]()

		for year1 in 1900...2016 {
    		if syowa.isMyEra(year:year1){
				let item: Dictionary<String, String> = [
					"year":String(year1)+"年", "jYear":syowa.getJYearFull(year:year1)
				]
				list.append(item)
    		}
			if heisei.isMyEra(year:year1){
				let item: Dictionary<String, String> = [
					"year":String(year1)+"年", "jYear":heisei.getJYearFull(year:year1)
				]
				list.append(item)
    		}
		}

		return list
	}

	public func getJYearList2() -> Dictionary<Int, String>{

		var list : Dictionary<Int, String> = [:]

		for year1 in 1900...2016 {
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
