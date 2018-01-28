//
//  MDDatePickerView.swift
//  majorDays
//
//  Created by 张 永盛 on 2018/1/28.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

class MDDatePickerView: UIView,UIPickerViewDataSource,UIPickerViewDelegate {
    var titleView : UIView!
    var datePicker : UIDatePicker!
    var datePicker1 : UIPickerView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.setSetup()
    }
    
    func setSetup() {
        self.titleView = UIView()
        self.titleView.backgroundColor = Constant.bgGrayColor()
        self.addSubview(self.titleView)
        
//        self.datePicker = UIDatePicker()
//        self.datePicker.datePickerMode = .date
//        self.datePicker.locale = Locale(identifier: "zh_CN")
//        self.addSubview(self.datePicker)
        
        self.datePicker1 = UIPickerView()
        self.datePicker1.selectRow(3, inComponent: 2, animated: true)
        self.datePicker1.dataSource = self
        self.datePicker1.delegate = self
        self.addSubview(self.datePicker1)
        
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
            return 30
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
//    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//        return
//    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
