//
//  Constant.swift
//  majorDays
//
//  Created by 张永盛 on 2018/1/20.
//  Copyright © 2018年 张永盛. All rights reserved.
//

import UIKit

class Constant: NSObject {
    class func redColor() -> UIColor {
        return RGBColor(241, green: 94, blue: 74, a: 1)  //f154ea
    }
    class func greenColor() -> UIColor {
        return RGBColor(162, green: 187, blue: 8, a: 1)  //a2bb08
    }
    class func blackColor() -> UIColor {
        return RGBColor(94, green: 94, blue: 94, a: 1)   //5e5e5e
    }
    class func grayColor() -> UIColor {
        return RGBColor(123, green: 124, blue: 125, a: 1)//7b7c7d
    }
    class func blueColor() -> UIColor {
        return RGBColor(74, green: 192, blue: 241, a: 1) //4ac0f1
    }
    class func mainColor() -> UIColor {
        return RGBColor(36, green: 151, blue: 237, a: 1) //2497ed
    }
    class func orangeColor() -> UIColor {
        return RGBColor(255, green: 168, blue: 29, a: 1) //ffa81d
    }
    class func bgGrayColor() -> UIColor {
        return RGBColor(246, green: 246, blue: 246, a: 1)
    }
    class func RGBColor(_ red: CGFloat, green: CGFloat, blue:CGFloat, a: CGFloat = 1.0) -> UIColor{
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: a)
    }
    class func RGBColorFromHEX(_ hex: Int, a: CGFloat = 1.0) ->UIColor{
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0xFF00) >> 8) / 255.0
        let blue = Double((hex & 0xFF)) / 255.0
        
        let color: UIColor = UIColor( red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: a)
        return color
    }
    class func getTimeInterval() -> Int {
        let date = NSDate()
        return Int(date.timeIntervalSince1970 * 1000)
    }
    class func getNowYearMonthDay()->String {
        let date = NSDate()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "yyyy-MM-dd"
        let strNowTime = timeFormatter.string(from: date as Date) as String
        return strNowTime
    }
    class func isOpenedApp() -> Bool{
        let defaults = UserDefaults.standard
        
        return defaults.bool(forKey: "is_first_open_app")
    }
    
    class func openedApp(){
        let defaults = UserDefaults.standard
        
        defaults.set(true, forKey: "is_first_open_app")
        
        defaults.synchronize()
    }
    //设置主题背景
    class func setThemeBGImage(imageName:String) {
        let defaults = UserDefaults.standard
        defaults.set(imageName, forKey: "themeImageName")
        defaults.synchronize()
    }
    //获取当前设置的主题背景
   class func getThemeBGImage() -> String {
        let defaults = UserDefaults.standard

        let bgName = defaults.object(forKey: "themeImageName") as! String
        return bgName;
    }
    class func getStringSizeMaxWidth(_ str:String, font:Int, maxWidth:CGFloat) -> CGSize
    {
        let attrs = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: CGFloat(font))]
        let size = str.boundingRect(with: CGSize(width: maxWidth, height: 1000), options:.usesLineFragmentOrigin, attributes: attrs, context: nil)
        let nw = ceil(size.width)
        let nh = ceil(size.height)
        return CGSize(width: nw, height: nh)
    }
//    //计算当月天数
//    func getDaysInCurrentMonth(year:Int,month:Int) -> Int {
////        let calendar = NSCalendar.currentCalendar()
////
////        let date = NSDate()
////        let nowComps = calendar.components([.Year, .Month, .Day], fromDate: date)
////        let year =  nowComps.year
////        let month = nowComps.month
//
//        let startComps = NSDateComponents()
//        startComps.day = 1
//        startComps.month = month
//        startComps.year = year
//
//        let endComps = NSDateComponents()
//        endComps.day = 1
//        endComps.month = month == 12 ? 1 : month + 1
//        endComps.year = month == 12 ? year + 1 : year
//
//        let startDate = Calendar.dateComponents(startComps)
////            .dateComponents(startComps)!
//        let endDate = Calendar.dateComponents(endComps)!
//
//        let diff = Calendar.components(.Day, fromDate: startDate, toDate: endDate,
//                                       options: .MatchFirst)
//        return diff.day
//    }
}
//let lanting_xi = "FZLanTingHeiS-EL-GB"
//
//let iOS7 = (UIDevice.current.systemVersion as NSString).doubleValue < Double(8.0)
//let iOS9 = (UIDevice.current.systemVersion as NSString).doubleValue >= Double(9.0)
//let iOS10 = (UIDevice.current.systemVersion as NSString).doubleValue >= Double(10.0)
//let iOS11 = (UIDevice.current.systemVersion as NSString).doubleValue >= Double(11.0)

//let iPhone4 = UIScreen.main.scale == 2.0 && UIScreen.main.bounds.size.height == 480.0
//let iPhone5 = UIScreen.main.scale == 2.0 && UIScreen.main.bounds.size.height == 568.0
//let iPhone6 = UIScreen.main.bounds.size.width > 370.0 && UIScreen.main.bounds.size.width < 400
//let iPhone6Plus = UIScreen.main.bounds.size.width > 400
//let iPhoneX = UIScreen.main.bounds.size.width > 400

//设备信息
let iosVersion = UIDevice.current.systemVersion //iOS版本
let identifierNumber = UIDevice.current.identifierForVendor //设备udid
let systemName = UIDevice.current.systemName //设备名称
let model = UIDevice.current.model //设备型号
let localizedModel = UIDevice.current.localizedModel //设备区域化型号如A1533

let KScreenWidth = UIScreen.main.bounds.size.width
let KScreenHeight = UIScreen.main.bounds.size.height

let LearnCloud_APPID = "dFUMgSWcdxlSBEOpWH4gCrVA-gzGzoHsz"
let LearnCloud_APPKEY = "RruAhf7oh0hAoLBr67odHk5e"

let service = "com.zys.majorDays"
let mainTheme = "scenery_bg3"

enum FontFmailyName: String {
    case AmericanTypewriter = "AmericanTypewriter"
    case BrushScript = "Brush Script"
    case MarkerFelt = "MarkerFelt"
    case Noteworthy = "Noteworthy"
}


