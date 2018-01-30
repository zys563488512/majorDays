//
//  MDDatePickerView.swift
//  majorDays
//
//  Created by 张 永盛 on 2018/1/28.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit
protocol MDDatePickerDelegate {
    func getDateP(isCenel:Bool,isType:Bool,currYear:Int,currMonth:Int,currDay:Int)
}
typealias funcBlockA = (Int,Int) -> String
class MDDatePickerView: UIView,UIPickerViewDataSource,UIPickerViewDelegate {
    var titleView : UIView!
    var datePicker : UIDatePicker!
    var datePicker1 : UIPickerView!
    var currYear = 0
    var currMonth = 0
    var currDay = 0
    var blockPropertyA : funcBlockA?
    var dayCount = 30
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.setSetup()
    }
    func testBlockA(blockfunc:funcBlockA!)
    {
        if (blockfunc) != nil
        {
            let retstr = blockfunc(5,6)
            print(retstr)
        }
    }
    func setSetup() {
        self.titleView = UIView()
        self.titleView.backgroundColor = Constant.bgGrayColor()
        self.addSubview(self.titleView)
        
        let cenelBtn = UIButton()
        cenelBtn.setTitle("取消", for: .normal)
        cenelBtn.setTitleColor(UIColor.gray, for: .normal)
        cenelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        cenelBtn.addTarget(self, action: #selector(self.cenelCLick(btn:)), for: .touchUpInside)
        self.titleView.addSubview(cenelBtn)
        cenelBtn.snp.makeConstraints { (make) in
            make.top.equalTo(0);
            make.left.equalTo(0);
            make.width.equalTo(50);
            make.height.equalTo(40);
        }
        let sureBtn = UIButton()
        sureBtn.setTitle("确定", for: .normal)
        sureBtn.setTitleColor(UIColor.gray, for: .normal)
        sureBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        sureBtn.addTarget(self, action: #selector(self.cenelCLick(btn:)), for: .touchUpInside)
        self.titleView.addSubview(sureBtn)
        cenelBtn.snp.makeConstraints { (make) in
            make.top.equalTo(0);
            make.left.equalTo(0);
            make.width.equalTo(50);
            make.height.equalTo(40);
        }
        
//        self.datePicker = UIDatePicker()
//        self.datePicker.datePickerMode = .date
//        self.datePicker.locale = Locale(identifier: "zh_CN")
//        self.addSubview(self.datePicker)
        let nowDate = Constant.getNowYearMonthDay()
        let arr = nowDate.components(separatedBy: "-") as NSArray
        self.datePicker1 = UIPickerView()
        self.datePicker1.dataSource = self
        self.datePicker1.delegate = self
        self.addSubview(self.datePicker1)
        
        self.currYear = Int(arr[0] as! String)!
        self.currMonth = Int(arr[1] as! String)!
        self.currDay = Int(arr[2] as! String)!
        
        self.datePicker1.selectRow(Int(arr[0] as! String)! - 1900, inComponent: 0, animated: true)
        self.datePicker1.selectRow(Int(arr[1] as! String)! - 1, inComponent: 1, animated: true)
        self.datePicker1.selectRow(Int(arr[2] as! String)! - 1, inComponent: 2, animated: true)

        self.titleView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(KScreenWidth)
            make.height.equalTo(40)
        }
        self.datePicker1.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleView.snp.bottom)
            make.width.equalTo(self.titleView.snp.width)
            make.height.equalTo((self.bounds.size.height - 40))
        }
//        self.datePicker.snp.makeConstraints { (make) in
//            make.top.equalTo(self.titleView.snp.bottom)
//            make.width.equalTo(self.titleView.snp.width)
//            make.height.equalTo((self.bounds.size.height - 40))
//        }
//
    }
    @objc func cenelCLick(btn:UIButton) {
//        if btn.tag == 1001 {
//            delegate?.getDateP(isCenel: true, isType: true, currYear: self.currYear, currMonth: self.currMonth, currDay: self.currDay)
//        }else {
//            delegate?.getDateP(isCenel: false, isType: true, currYear: self.currYear, currMonth: self.currMonth, currDay: self.currDay)
//        }
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 2200 - 1900
        case 1:
            return 12
        case 2:
            return Constant.getDaysInMonth(year: self.currYear, month: self.currMonth)
        default:
            return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: KScreenWidth/3, height: 20))
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor = UIColor.black
        switch component {
        case 0:
            label.text = String(row + 1900)
            return label
        case 1:
            label.text = String(row + 1)
            return label
        case 2:
            label.text = String(row + 1)
            return label
        default:
            label.text = ""
            return label
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            self.currYear = 1900 + row
            self.datePicker1.reloadComponent(2)
            break
        case 1:
            self.currMonth = row + 1
            self.datePicker1.reloadComponent(2)
            break
        case 2:
            self.currDay = row + 1
            break
        default:
            break
        }
    }
//    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//        return
//    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
